class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers

  def correct_answer
    answers.find_by_correctness(true)
  end

end