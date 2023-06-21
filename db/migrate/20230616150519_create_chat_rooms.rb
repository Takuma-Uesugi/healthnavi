class CreateChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_rooms do |t|
      t.references :user, null: false, foreign_key: true, unique: true
      t.references :adviser, null: false, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
