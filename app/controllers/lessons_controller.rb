class LessonsController < ApplicationController
  def index
    #@lessons = Lesson.all
    redirect_to subjects_path
    # dont view all lessons
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      render :show
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      flash[:success] = "Lesson updated."
      redirect_to @lesson
    else
      render 'edit'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def destroy
  end

  private
    def lesson_params
      params.require(:lesson).permit(:name, :date, :subject_id)
    end
end
