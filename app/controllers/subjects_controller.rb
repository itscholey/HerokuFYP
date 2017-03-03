class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    teacher = User.find(@subject.teacher_id)
    if teacher.role?(:teacher) or teacher.role?(:admin)
      if @subject.save
        render :show
      else
        redirect_to new_subject_path
      end
    else
      flash[:danger] = "#{teacher.id} Not a teacher"
      render :new
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
      params.require(:subject).permit(:name, :classGroup, :teacher_id)
    end
end
