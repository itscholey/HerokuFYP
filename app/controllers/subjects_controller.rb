class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    teacher = User.find(@subject.user_id)
      if @subject.save
        render :show
      else
        redirect_to new_subject_path
      end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:success] = "Subject updated."
      redirect_to @subject
    else
      render 'edit'
    end
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def destroy
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :classGroup, :user_id, user_ids: [])
    end
end
