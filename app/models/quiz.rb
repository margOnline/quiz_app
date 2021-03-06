class Quiz < ActiveRecord::Base

  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: ->(q) {q[:query].blank?}
  
  validates :title, presence: true
  validates :author, presence: true

  # def populate(num_of_questions: 0, num_of_answers: 0)
  #   num_of_questions.times do |variable|
  #     question = questions.build
  #     question.populate_answers(num_of_answers)
  #   end
  # end

  def correct_answer_ids
    questions.map { |q| q.correct_answer.id }
  end

  def build_questions(count=6, num_of_answers=4)
    # populate(num_of_questions: count, num_of_answers: num_of_answers)
    (count-questions.to_a.count).times { questions.build }
    questions.each do |question| 
      (num_of_answers-question.answers.to_a.count).times { question.answers.build }
    end
  end

end
