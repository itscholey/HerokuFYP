class EnrolmentsController < ApplicationController
  def new
    @enrolment = Enrolment.new
  end

  def create
    @enrolment = Enrolment.new(enrolment_params)
    if @enrolment.save
      render :show
    else
      render :new
    end
  end

  def show
    @enrolment = Enrolment.find(params[:id])
  end

  private

  def enrolment_params
    params.require(:enrolment).permit(:student_id, :subject_id)
  end
end
