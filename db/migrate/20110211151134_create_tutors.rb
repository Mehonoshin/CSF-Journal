class CreateTutors < ActiveRecord::Migration
  def self.up
    create_table :tutors do |t|
      t.string :name
      t.string :position
      t.string :grade
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tutors
  end
end
