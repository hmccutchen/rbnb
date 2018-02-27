class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]



  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index

    if params[:query]
      @dogs = Dog.search_by_breed_name_age(params[:query])
      @search_term = params[:query]
    else
      @dogs = Dog.all
    end

    @dogs = @dogs.where.not(latitude: nil, longitude: nil)

    @markers = @dogs.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        infoWindow: { content: render_to_string(partial: "/dogs/map_box", locals: { dog: dog }) }
      }
    end
  end

  def show

    @dog = Dog.find(params[:id])

     @marker = [{
        lat: @dog.latitude,
        lng: @dog.longitude,
      }]


    # @dog = Dog.find(params[:id])

  end

  def edit
    # @dog = Dog.find(params[:id])
  end

  def update
    # @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    current_user == @dog.user
    @dog.destroy
    redirect_to dog_path
    else
    flash[:alert] = "this is not your dog!"
    redirect_to dogs_path

  end

  def new
    @dog = Dog.new
  end

def create
  @dog = Dog.new(dog_params)
  @dog.user = current_user
  @dog.save
  redirect_to dog_path(@dog)
end

def destroy
  # @dog = Dog.find(params[:id])
  if current_user == @dog.user
    @dog.destroy
    redirect_to dogs_path
  else
    flash[:alert] = "this is not your dog!"
    redirect_to dogs_path
  end
end

private

def dog_params

  params.require(:dog).permit(:name, :breed, :age, :address, :description, :user_id, :photo)
end

def set_dog
  @dog = Dog.find(params[:id])
end


end

