class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      render :show
    else
      render :new
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update_attributes(meeting_params)
      flash[:success] = "Meeting updated."
      redirect_to @meeting
    else
      render 'edit'
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  private

  def meeting_params
    params.require(:meeting).permit(:subject, :date, :location, :agenda, user_ids: [])
  end
end
