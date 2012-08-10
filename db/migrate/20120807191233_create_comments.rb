class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.text :content
      t.references :recipe

      t.timestamps
    end
  end
end
