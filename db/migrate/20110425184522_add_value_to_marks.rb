class AddValueToMarks < ActiveRecord::Migration
  def self.up
    add_column :marks, :value, :string
  end

  def self.down
    add_column :marks, :value
  end
end
