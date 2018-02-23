class ReservationsController < ApplicationController
  before_action :set_dog, only: [:create, :new, :destroy]


  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.dog = @dog
    @reservation.user = current_user
    if @reservation.save!
      flash[:notice] = "Succesfully made a reservation"
      redirect_to dogs_path
    else
      flash[:alert] = "You shall not pass"
      render :new  # renders the new view
    end

    def show
    end


  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to dogs_path
  end
   end


  private

  def reservation_params
    params.require(:reservation).permit(:date)
  end

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

end
