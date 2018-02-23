class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit

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
  @dog = Dog.find(params[:id])
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

  params.require(:dog).permit(:name, :breed, :age, :description, :user_id)
end


end

