class Api::V1::CoursesController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, only: %i[show index]
    
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

    # POST /api/v1/courses
    def create
        @course = Course.new(course_params)
        if @course.save
            render json: @course, status: :created
        else
            render json: { errors: @course.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    # PUT /api/v1/courses/:id
    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
            render json: @course, status: :ok
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