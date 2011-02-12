class AddProfileIdAndProfileTypeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_id, :integer
    add_column :users, :profile_type, :string
  end

  def self.down
    remove_column :users, :profile_id
    remode_column :users, :profile_type
  end
end
