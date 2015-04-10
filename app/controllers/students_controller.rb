class StudentsController < ApplicationController
	def index
		binding.pry
		@students = Student.all
	end

	def show

	end
end