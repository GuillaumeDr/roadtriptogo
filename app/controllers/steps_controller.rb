class StepsController < ApplicationController
  before_action :set_step, only: [:edit, :update, :destroy]

  def new
    @step = Step.new
    @project = Project.find(params[:project_id])
  end

  def create
    @step = Step.new(step_params)
    @project = Project.find(params[:project_id])
    @step.end_date = params[:step][:start_date].split(' to ').last
    @step.project = @project
    if @step.save
      redirect_to edit_project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @step.update(step_params)
    redirect_to step_path(@step)
  end

  def destroy
    @step.destroy
    redirect_to mysteps_path
  end

  private

  def step_params
    params.require(:step).permit(:start_date, :end_date, :city)
  end

  def set_step
    @step = Step.find(params[:id])
  end
end
