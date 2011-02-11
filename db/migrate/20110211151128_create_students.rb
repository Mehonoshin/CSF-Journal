class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.integer :student_number
      t.integer :user_id      
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
