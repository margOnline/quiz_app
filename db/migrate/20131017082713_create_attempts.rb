class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
