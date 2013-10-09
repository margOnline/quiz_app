require 'spec_helper'

describe Question do
  it { should belong_to(:quiz) }
  it { should have_many(:answers) }

  it 'knows the correct answer' do
    question = Question.create(query: 'Capital of France?')
    london = Answer.create(response: 'London', correctness: false)
    paris = Answer.create(response: 'Paris', correctness: true)
    question.answers << london
    question.answers << paris

    expect(question.correct_answer).to eq paris
  end
end
