class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Your Employee has been saved!"
      redirect_to employees_path
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    # We need to figure out how to add an employee to multiple projects. I also think that adding an employee to a project by ID number isn't as user friendly as we can make it. Adding by project name would be much better.
    if @employee.update(employee_params)
      flash[:notice] = "Your Employee has been updated!"
      redirect_to employees_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :position, :start_date, :personal_development_plan, :life_quote, :quote, :motto, :strength, :myers_briggs, :birkman, :vision, :short_term_goal, :long_term_goal, :area_to_develop, :objective_setting, :personal_goal, :project_id, :team_id)
  end
end
