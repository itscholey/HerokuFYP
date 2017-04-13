class WorkLogsController < ApplicationController
  def index
    @worklogs = WorkLog.all
  end

  def new
    @worklog = WorkLog.new
  end

  def create
    @worklog = WorkLog.new(worklog_params)
    if @worklog.in_school.nil?
      @worklog.in_school = false
    end
    if @worklog.save
      render 'index'
    else
      render 'new'
    end
  end

  private

  def worklog_params
    params.require(:work_log).permit(:student_id, :lesson_id, :date, :time_spent, :in_school)
  end
end
