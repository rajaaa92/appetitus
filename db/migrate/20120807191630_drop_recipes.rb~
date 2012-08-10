class CreateCookbooks < ActiveRecord::Migration
  def self.up
    create_table :cookbooks do |t|
      t.references :user
      t.references :recipe

      t.timestamps
    end
  end

  def self.down
    drop_table :cookbooks
  end
end
