class RenameGroupIdToCourseId < ActiveRecord::Migration
  def self.up
    rename_column :marks, :subject_id, :course_id
  end

  def self.down
  end
end
