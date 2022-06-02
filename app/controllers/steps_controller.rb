class StepsController < ApplicationController
  before_action :set_step, only: [:edit, :update, :destroy]

  def new
    @step = Step.new
    @project = Project.find(params[:project_id])
  end

  def newstep
    @step = Step.new
    @project = Project.find(params[:project_id])
  end

  def create
    @step = Step.new(step_params)
    @project = Project.find(params[:project_id])
    @step.end_date = params[:step][:start_date].split(' to ').last
    @step.project = @project
    if @step.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
  end

  def update
    @step.update(step_params)
    @project = Project.find(params[:project_id])
    @step.end_date = params[:step][:start_date].split(' to ').last
    if @step.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @step.destroy
    @project = Project.find(params[:project_id])
    redirect_to project_path(@project)
  end

  private

  def step_params
    params.require(:step).permit(:start_date, :end_date, :city)
  end

  def set_step
    @step = Step.find(params[:id])
  end
end
