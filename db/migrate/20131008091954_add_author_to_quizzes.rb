class AddAuthorToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :author, :string, default: 'No author'
  end
end
