class AddEventIdToEventOccurrences < ActiveRecord::Migration[6.0]
  def change
    add_column :event_occurrences, :event_id, :integer
  end
end
