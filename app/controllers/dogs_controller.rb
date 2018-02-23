class DogsController < ApplicationController

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

private

def dog_params

  params.require(:dog).permit(:name, :breed, :age, :description, :user_id)
end


end

