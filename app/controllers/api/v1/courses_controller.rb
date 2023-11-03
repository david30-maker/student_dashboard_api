class Api::V1::CoursesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[show index]

  def show
    @course = Course.find(params[:id])
    render json: @course, status: :ok
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: { errors: @course.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private
  def course_params
    params.require(:course).permit(:name, :description)
  end
end
