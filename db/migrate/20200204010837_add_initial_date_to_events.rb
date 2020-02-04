class AddInitialDateToEvents < ActiveRecord::Migration[6.0]
  def up
    add_column :events, :initialDate, :datetime
  end
  def remove
    add_column :events, :initialDate
  end
end
