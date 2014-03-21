class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answerone
      t.string :answertwo
      t.references :assignment
      t.references :student

      t.timestamps
    end
    add_index :answers, :assignment_id
    add_index :answers, :student_id
  end
end
