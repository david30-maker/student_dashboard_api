class Api::V1::CoursesController < ApplicationController
    skip_before_action :authenticate_request, only: %i[show index]
    
    # GET /api/v1/courses
    def index
        @courses = Course.all
        render json: @courses, status: :ok
    end
    
    # GET /api/v1/courses/:id
    def show
        @course = Course.find(params[:id])
        render json: @course, status: :ok
    end

    private
    def course_params
        params.require(:course).permit(:name, :description)
    end
end