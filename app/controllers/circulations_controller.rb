class CirculationsController < ApplicationController
  def show
    @circulation = Circulation.find(params[:id])
  end

  def new
    @circulation = Circulation.new
  end

  def create
    @circulation = Circulation.new(circulation_params)
    if @circulation.save
      flash[:success] = "Welcome to the Book App!"
      redirect_to @circulation
    else
      render 'new'
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
