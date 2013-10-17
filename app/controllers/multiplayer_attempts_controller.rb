class MultiplayerAttemptsController < ApplicationController
  
  def index
    @quiz = Quiz.find params[:quiz_id]
  end

  def check_answer
    answer_id = params[:id]
    question_id = params[:question_id]
    question = Question.find question_id
    answer = question.answers.find answer_id
    result = {correct: answer.correctness}

    WebsocketRails[:answers].trigger 'score', 
    render json: result
  end
end
