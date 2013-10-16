class QuizzesController < ApplicationController

  before_filter :authenticate_user!, only:[:new, :create]

  def index
    @quizzes = Quiz.all
  end

  def create
    @quiz = Quiz.new quiz_params
    if @quiz.save
      WebsocketRails[:quizzes].trigger 'new', @quiz
      redirect_to @quiz
    else
      render :template => '/quizzes/new.html.haml'
    end
  end

  def new
    @quiz = Quiz.new
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def edit
    @quiz = Quiz.find params[:id]
  end

  def update
    @quiz = Quiz.find params[:id]
    if @quiz.update quiz_params
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to root_path
  end

  def quiz_params
    params.require(:quiz).permit :title, :author, questions_attributes:[:id, :query, answers_attributes:[:id, :response, :correctness]]
  end
  

end
