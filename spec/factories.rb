FactoryGirl.define do 

  factory :quiz do  
    title 'My quiz'
  end

  factory :right_answer,  class: Answer do
    response "Correct"
    correctness true
  end

  factory :wrong_answer, class: Answer do
    response "Incorrect"
    correctness false
  end

end


#call the factory the same name as the model