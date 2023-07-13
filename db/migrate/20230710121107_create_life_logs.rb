class CreateLifeLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :life_logs do |t|
      t.references :user, null: false
      t.integer :sleepiness, null: false
      t.integer :feeling, null: false
      t.integer :feces, null: false
      t.text :foods, null: false
      
      t.timestamps
    end
  end
end
