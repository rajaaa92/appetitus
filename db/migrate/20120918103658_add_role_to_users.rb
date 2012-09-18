class AddRoleToUsers < ActiveRecord::Migration
  def up
    add_column :users, :role, :string, :default => "logged_in"
  end
	def down
    remove_column :users, :role
  end
end
