class CreateContentCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :content_categories do |t|
      t.references :content, null: false, unique: true
      t.references :category, null: false, unique: true

      t.timestamps
    end
  end
end
