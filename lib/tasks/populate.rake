namespace :db do 

  desc "Fill quizzes with sample data" 
  task populate_quiz: :environment do 
    @quizzes = [
      ['Western European Capital Cities', 'MargOnline'],
      ['American State Capitals', 'MargOnline'],
      ['African Capital Cities', 'MargOnline'],
      ['Eastern European Capital Cities', 'MargOnline'],
      ['Asian Capital Cities', 'MargOnline']
    ]
    5.times do |n|
      puts "[DEBUG] creating quiz #{n+1} of #{@quizzes.count}"
      Quiz.create(title: @quizzes[n][0], author: @quizzes[n][1])
    end
  end

  desc "Fill questions d/b with sample data" 
  task populate_question: :environment do 
    @questions = [
      ['What is the capital of France', 1],
      ['What is is the capital of Spain', 1],
      ['What is the capital of Italy', 1],
      ['What is the capital of Portugal', 1],
      ['What is the capital of Wales', 1],
      ['What is the capital of Texas', 2],
      ['What is the capital of Florida', 2],
      ['What is is the capital of California', 2],
      ['What is is the capital of Colorado', 2],
      ['What is is the capital of Illinois', 2],
      ['What is the capital of England', 1],
      ['What is is the capital of Switzerland', 1],
      ['What is the capital of Belgium', 1],
      ['What is the capital of Scotland', 1],
      ['What is the capital of Andorra', 1],
      ['What is the capital of Nevada', 2],
      ['What is the capital of Ohio', 2],
      ['What is is the capital of Massachusetts', 2],
      ['What is is the capital of Pennsylvania', 2],
      ['What is is the capital of Vermont', 2]
    ]
    20.times do |n|
      puts "[DEBUG] creating question #{n+1} of #{@questions.count}"
      Question.create(query: @questions[n][0], quiz_id: @questions[n][1])
    end
  end

  desc "Fill answers database with sample data" 
  task populate_answer: :environment do 
    @question_answers = [
      ['Paris',TRUE, 1],
      ['Spain',TRUE, 1],
      ['Milan',TRUE, 3],
      ['Lisbon', TRUE,4],
      ['Cardiff',TRUE, 5],
      ['Austin', TRUE,6],
      ['Tallahassee', TRUE,7],
      ['Sacramento', TRUE,8],
      ['Denver', TRUE,9],
      ['Springfield', TRUE,10],
      ['Paris', TRUE,11],
      ['Spain', TRUE,12],
      ['Milan', TRUE,13],
      ['Lisbon',TRUE, 14],
      ['Cardiff', TRUE,15],
      ['Austin', TRUE,16],
      ['Tallahassee',TRUE, 17],
      ['Sacramento', TRUE,18],
      ['Denver', TRUE,19],
      ['Springfield',TRUE, 20]
    ]
    20.times do |n|
      puts "[DEBUG] creating answer #{n+1} of #{@question_answers.count}"
      Answer.create(response: @question_answers[n][0], correctness: @question_answers[n][1], question_id: @question_answers[n][2])
    end
  end
end   