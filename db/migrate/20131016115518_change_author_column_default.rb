class ChangeAuthorColumnDefault < ActiveRecord::Migration
  
  def change
    change_column_default(:quizzes, :author, nil)
  end

end
