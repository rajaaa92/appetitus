class AddRateToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :rate, :integer, :default => 0
  end

	def down
		remove_column :recipes, :rate
	end
end
