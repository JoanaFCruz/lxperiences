class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create

  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :location, :price, :user)
  end
end
