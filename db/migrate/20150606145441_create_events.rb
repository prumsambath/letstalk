class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :topic
      t.text :agenda
      t.datetime :due_at
      t.integer :seat
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
