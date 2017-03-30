class ActionplansController < ApplicationController
  def index
    @actionplans = Actionplan.all
  end

  def new
    @actionplan = Actionplan.new
  end

  def create
    @actionplan = Actionplan.new(actionplan_params)
    if @actionplan.save
      render :show
    else
      render :new
    end
  end

  def edit
    @actionplan = Actionplan.find(params[:id])
  end

  def update
    @actionplan = Actionplan.find(params[:id])
    if @actionplan.update_attributes(actionplan_params)
      flash[:success] = "Action Plan updated."
      redirect_to @actionplan
    else
      render 'edit'
    end
  end

  def show
    @actionplan = Actionplan.find(params[:id])
  end


  private

  def actionplan_params
    params.require(:actionplan).permit(:title, :description, :student_id, :supervisor_id)
  end
end
