class AttemptsController < ActionController::Base
  
    def new
      @quiz = Quiz.find params[:quiz_id]
      render layout: 'application'
    end

    def create
      # @attempt = Attempt.new
      # raise params.inspect
      if params[:answer_ids]
        @quiz = Quiz.find params[:quiz_id]
        answer_ids = params[:answer_ids].values
        scorer = Scorer.new(@quiz)
        percent = (scorer.total(answer_ids) / @quiz.questions.count.to_f) * 100
        
        flash[:notice] = "You scored #{percent.to_i}%"
        redirect_to '/'
      else
        flash[:notice] = "You must answer some questions"
        render 'new'
      end
    end

end