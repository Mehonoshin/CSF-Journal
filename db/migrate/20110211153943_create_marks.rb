class CreateMarks < ActiveRecord::Migration
  def self.up
    create_table :marks do |t|
      t.integer :student_id      
      t.integer :tutor_id
      t.integer :group_id      
      t.timestamps
    end
  end

  def self.down
    drop_table :marks
  end
end
