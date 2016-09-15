class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text, null: false, default: ""
      t.timestamps
    end

    add_reference :messages, :sender, foreign_key: { to_table: :users }, null: false
    add_reference :messages, :receiver, foreign_key: { to_table: :users }, null: false
  end
end
