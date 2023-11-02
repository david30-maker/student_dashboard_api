class Api::V1::EnrollmentsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, only: %i[show index]

    # POST /api/v1/enrollments
    def create
        @enrollment = Enrollment.new(enrollment_params)
        if @enrollment.save
            render json: @enrollment, status: :created
        else
            render json: @enrollment.errors, status: :unprocessable_entity
        end
    end

    private
    def enrollment_params
        params.require(:enrollment).permit(:user_id, :course_id)
    end
end