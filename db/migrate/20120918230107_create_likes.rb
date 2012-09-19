class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes
		add_column :likes, :user_id, :integer
		add_column :likes, :recipe_id, :integer
    
  end
end
