class Quiz < ActiveRecord::Base

  has_many :questions
  accepts_nested_attributes_for :questions

  validates :title, presence: true

  def answers_id
    questions.map { |q| q.correct_answer_id }
  end

end