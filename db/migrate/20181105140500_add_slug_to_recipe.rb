class AddSlugToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :slug, :string

    Recipe.where("slug is null").each do |recipe|
      recipe.save
    end

    change_column_null :recipes, :slug, false

    add_index :recipes, :slug, unique: true
  end
end
