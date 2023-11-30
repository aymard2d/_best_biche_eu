class BookingsController < ApplicationController
  def create
    @animal = Animal.new
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to animals_path, notice: "Votre réservation a bien été ajoutée"
    else
      render "animals/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :animal_id)
  end
end
