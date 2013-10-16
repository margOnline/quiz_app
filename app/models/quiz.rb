class Quiz < ActiveRecord::Base

  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: ->(q) {q[:query].blank?}

  after_initialize :build_questions

  validates :title, presence: true
  validates :author, presence: true

  def populate(num_of_questions: 0, num_of_answers: 0)
    num_of_questions.times do |variable|
      question = questions.build
      question.populate_answers(num_of_answers)
    end
  end

  def correct_answers_id
    questions.map { |q| q.correct_answer_id }
  end


  def build_questions(count=6)
    (count-questions.to_a.count).times {questions.build}
  end


end
