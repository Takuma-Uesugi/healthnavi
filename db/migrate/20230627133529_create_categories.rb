class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :ja_name, limit: 10, null: false, unique: true
      t.string :en_name, limit: 20, null: false, unique: true

      t.timestamps
    end
  end
end
