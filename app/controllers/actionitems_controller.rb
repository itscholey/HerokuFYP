class ActionitemsController < ApplicationController

  def new
    @actionitem = Actionitem.new
  end

  def create
    @actionitem = Actionitem.create(actionitem_params)
    if @actionitem.save
      redirect_to @actionitem.actionplan
    else
      render :new
    end
  end


  private

  def actionitem_params
    params.require(:actionitem).permit(:name, :description, :target_completion_date,
                                        :actionplan_id, user_ids: [])
  end
end
