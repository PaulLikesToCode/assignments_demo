class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :questionone
      t.string :questiontwo

      t.timestamps
    end
  end
end
