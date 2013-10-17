require 'spec_helper'

describe Quiz do

  it { should have_many(:questions) }
  it "should populate correctly" do
    quiz = Quiz.new
    quiz.build_questions(count=6, num_of_answers=4)
    expect(quiz.questions.to_a.count).to eq 6
    answers_counts = quiz.questions.map{|q| q.answers.to_a.count }
    expect(answers_counts.all?{|c| c==4 }).to be_true
  end

  describe "with params" do
      let(:quiz){Quiz.new(title: "Test", author: "J", questions_attributes: [query: "Why?", answers_attributes: [{response: "a", correctness: true},{response: "b", correctness: false}]])}
    it "should only repopulate rejected answers" do
      quiz.build_questions(count=6, num_of_answers=4)
      expect(quiz.questions.to_a.count).to eq 6
      expect(quiz.questions.map{|q| q.answers.to_a.count}.all?{|c| c==4}).to be_true
    end

    it "doesn't save empty questions" do
      quiz.save
      expect(quiz.questions.count).to eq 1
    end

    it "doesn't save empty answers" do
      quiz.save
      expect(quiz.questions.first.answers.count).to eq 2
    end
  end

end
