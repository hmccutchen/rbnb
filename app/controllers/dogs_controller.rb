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
  end



end

