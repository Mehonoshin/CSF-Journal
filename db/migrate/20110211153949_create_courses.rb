class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.integer :tutor_id
      t.integer :group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
