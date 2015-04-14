class StudentsController < ApplicationController

	def index
		@students = Student.all
	end

	def show
		@student = Student.find_by_id(params[:id])
	end

	def destroy
		@student = Student.find_by_id(params[:id])
		binding.pry
		if @student
			@student.destroy
			redirect_to students_path
		end
	end
end