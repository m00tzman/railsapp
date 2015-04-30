class ProjectsController < ApplicationController

	before_action :authenticate_user!, except: :index

	def index
		if params[:search]
			@projects = Project.search(params[:search])
		else
		@projects = Project.all
		end
	end

	def show
		@project = Project.find_by_id(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to project_path(@project), notice: "Project was added successfully" 
		else
			flash[:alert] = "There was an error creating the project"
			render :new
		end
	end

	def destroy
		@project = Project.find_by_id(params[:id])

		if @project.destroy
			flash[:notice] = "#{@project.name} was successfully deleted!"
		else
			flash[:alert] = "There was an error while attempting to delete this project."
		end
		redirect_to projects_path
	end

	def edit
		@project = Project.find_by_id(params[:id])	
	end

	def update
		@project = Project.find_by_id(params[:id])

		if @project.update_attributes(project_params)
			redirect_to projects_path, notice: "Project was updated successfully"
		else
			flash[:alert] = "There was an error modifying the Project"
			render :edit
		end
	end

private

	def project_params
		params.require(:project).permit(:name)
	end
end