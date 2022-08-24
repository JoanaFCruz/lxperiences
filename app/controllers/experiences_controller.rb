class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = Experience.all
    @experiences = policy_scope(Experience)
    @markers = @experiences.geocoded.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude,
        info_window: render_to_string(partial: "info_window", locals: {experience: experience})
      }
    end
  end

  def show
    authorize @experience
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    authorize @experience
    if @experience.save
      redirect_to @experience, notice: "Experience was created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @experience
  end

  def update
    authorize @experience
  end

  def destroy
    authorize @experience
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :location, :price, :user)
  end
end
