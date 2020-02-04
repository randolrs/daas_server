class CreateEventOccurrences < ActiveRecord::Migration[6.0]
  def change
    create_table :event_occurrences do |t|
      t.datetime :event_date
      t.text :description

      t.timestamps
    end
  end
end
