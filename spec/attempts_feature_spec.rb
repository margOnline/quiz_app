describe 'taking a quiz' do

  before do
    @quiz.create
    question1
    question2

    @quiz.questions
  end

  it 'shoudl show me the score' do
    visit new_quiz