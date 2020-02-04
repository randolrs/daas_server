class AddRecurrenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :recurrence, :string
  end
end
