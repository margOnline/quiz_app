class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :response
      t.boolean :correctness

      t.timestamps
    end
  end
end
