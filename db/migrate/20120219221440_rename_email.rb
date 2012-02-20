class RenameEmail < ActiveRecord::Migration
  def self.up
    rename_column :Users, :eamil, :email
  end

  def down
  end
end
