class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    # redirect_to '/'
  end

  def new
    @quiz = Quiz.new
    @quiz.questions.build
  end

  def edit
    @quiz = Quiz.find params[:id]
  end

  def update
    @quiz = Quiz.find params[:id]
    if @quiz.update params[:quiz].permit(:title)
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  def create
    @quiz = Quiz.new params[:quiz].permit(:title, questions_attributes: [:query])

    if @quiz.save
      redirect_to @quiz
    else
      render 'new'
    end
  end

end
