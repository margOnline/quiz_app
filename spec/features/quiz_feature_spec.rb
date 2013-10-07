require 'spec_helper'

def create_quiz(some_title)
  Quiz.create({:title => some_title})
end

describe 'the quizzes page' do
  it 'should display quizzes' do
    create_quiz 'Some quiz'
    visit '/quizzes'

    expect(page).to have_content 'Some quiz'
  end
end