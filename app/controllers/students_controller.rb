class StudentsController < ApplicationController

	def index
		@students = Student.all
	end

	def show
		@student = Student.find_by_id(params[:id])
	end

	def destroy
		@student = Student.find_by_id(params[:id])

		if @student.destroy
			flash[:notice] = "#{@student.full_name} was successfully deleted!"
		else
			flash[:alert] = "There was an error while attempting to delete this student."
		end

		redirect_to students_path
	end
end