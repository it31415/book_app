class CirculationsController < ApplicationController

  def index
    @circulations = Circulation.order(:checkout_date, :id)
  end

  def show
    @circulation = Circulation.find(params[:id])
  end

  def new
    @circulation = Circulation.new
    @circulation.checkout_date = Date.today
  end

  def create
    @circulation = Circulation.new(circulation_params)
    if @circulation.save
      flash[:success] = "本を貸し出しました!"
      redirect_to @circulation
    else
      render 'new'
    end
  end

  def edit
    @circulation = Circulation.find(params[:id])
  end

  def update
    @circulation = Circulation.find(params[:id])
    if @circulation.update_attributes(circulation_params)
      flash[:success] = "貸出情報が更新されました！"
      redirect_to @circulation
    else
      render 'edit'
    end
  end

  def return
    @circulation = Circulation.find(params[:id])
    if @circulation.update(return_date: Date.today)
      flash[:success] = "本を返却しました！"
      redirect_to circulations_url
    else
      render 'edit'
    end
  end

  def destroy
    Circulation.find(params[:id]).destroy
    flash[:success] = "貸出情報を削除しました"
    redirect_to circulations_url
  end

  private

    def circulation_params
      params.require(:circulation).permit(
        :user_name,
        :book_title,
        :checkout_date,
        :return_date
      )
    end
end
