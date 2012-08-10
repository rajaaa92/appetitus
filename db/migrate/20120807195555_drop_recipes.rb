class DropRecipes < ActiveRecord::Migration
  def self.up
    drop_table :recipes
  end
end
