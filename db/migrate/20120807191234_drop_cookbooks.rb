class DropCookbooks < ActiveRecord::Migration
  def self.up
    drop_table :cookbooks
    
  end

end
