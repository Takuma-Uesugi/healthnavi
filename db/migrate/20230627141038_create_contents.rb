class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.references :adviser, null: false
      t.string :title, limit: 30, null: false
      t.string :image, null: false
      t.string :first_paragraph, limit: 30, null: false
      t.text :first_content, null: false
      t.string :second_paragraph, limit: 30
      t.text :second_content
      t.string :third_paragraph, limit: 30
      t.text :third_content
      
      t.timestamps
    end
  end
end
