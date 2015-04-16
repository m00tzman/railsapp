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

	def edit
		@student = Student.find_by_id(params[:id])	
	end

	def update
		@student = Student.find_by_id(params[:id])

		# if student is found
		# call update attributes on student and pass in field values
		# show flash message confirming successful update
		# redirect to index page
		# if student is not found
		# render :edit page with flash message
		# call update_attributes on

		if @student.update_attributes(params[:student])
			redirect_to students_path, notice: "Student was updated successfully"
		else
			flash[:alert] = "There was an error modifying the student"
			render :edit
		end
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