class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :event_registrations, :event_id
    add_index :event_registrations, :user_id
  end
end
