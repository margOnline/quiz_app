class AttemptsController < ActionController::Base
  
    def new
      @quiz = Quiz.find params[:quiz_id]
    end

    def create
      @quiz = Quiz.find params[:quiz_id]
      scorer = Scorer.new(@quiz)
      render "#{scorer.total(params[:answer_ids])}%"
    end

    def show
      
    end

end