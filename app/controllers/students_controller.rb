class StudentsController < ApplicationController

	def index
		@students = Student.all
	end

	def show
		@student = Student.find_by_id(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(params[:student])

		if @student.save
			redirect_to student_path(@student), notice: "Student was added successfully" 
			#easier way than what you did in destroy
		else
			flash[:alert] = "There was an error creating the student"
			render :new
			#spits you back to page
		end
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