class CirculationsController < ApplicationController

  def index
    @circulations = Circulation.all
  end

  def show
    @circulation = Circulation.find(params[:id])
  end

  def new
    @circulation = Circulation.new
  end

  def create
    @circulation = Circulation.new(circulation_params)
    if @circulation.save
      flash[:success] = "図書館サービスへようこそ!"
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
    if @circulation.update(return_date: Date.today.to_s)
      flash[:success] = "本を返却しました！"
      redirect_to circulations_url
    else
      render 'edit'
    end
  end

  private

    def circulation_params
      params.require(:circulation).permit(
        :user_name,
        :book_name,
        :checkout_date,
        :return_date
      )
    end
end
