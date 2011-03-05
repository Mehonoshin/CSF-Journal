class AddSubjectIdToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :subject_id, :integer
  end

  def self.down
    add_column :courses, :subject_id
  end
end
