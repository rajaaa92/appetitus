class RemoveRateFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :rate
  end

  def down
    add_column :recipes, :rate, :string
  end
end
