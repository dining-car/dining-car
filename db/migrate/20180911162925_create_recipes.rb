class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :info
      t.boolean :public
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
