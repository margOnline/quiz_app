class RemoveCorrectnessFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :correctness, :boolean
  end
end
