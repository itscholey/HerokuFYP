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
  end

  def show
    @actionplan = Actionplan.find(params[:id])
  end

  private

  def actionplan_params
    params.require(:actionplans).permit(:title, :description, :student_id, :supervisor_id)
  end
end
