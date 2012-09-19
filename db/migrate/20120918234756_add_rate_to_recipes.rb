class AddRateToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :rate, :integer
  end
end
