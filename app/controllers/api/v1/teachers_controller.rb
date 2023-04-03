module Api
    module V1
        class TeachersController < ApplicationController
            def index
                @teachers = Teacher.all
                render json: @teachers
            end

            def show
                @teachers = Teacher.find(params[:id])
                render json: @teachers
            end

            def update
                @teachers = Teacher.find(params[:id])
                if @teachers.update(teacher_params)
                    render json: @teachers
                else
                    render json: @teachers.errors, status: unprocessable_entity
                end
                    
            end

            def destroy
                @teachers = Teacher.find(params[:id])
                if @teachers.present?
                    @teachers.destroy
                    render json: @teachers 
                else
                    render json: {error: "teacher not found"}
                end
            end

            
            def create
                @teachers = Teacher.new(teacher_params)
                if @teachers.save
                    render json: @teachers
                else
                    render json: @teachers.errors, status: unprocessable_entity
                end
            end

            private

            def teacher_params
                params.require(:teacher).permit(:name, :address)
            end

        end
    end
end

