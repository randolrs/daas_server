class CreateEventsEventTags < ActiveRecord::Migration[6.0]
  def change
    create_table :events_event_tags do |t|
      t.integer :event_id
      t.integer :event_tag_id

      t.timestamps
    end
  end
end
