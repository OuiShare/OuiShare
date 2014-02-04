class FixDateOnEvents < ActiveRecord::Migration
  def change
    rename_column :events, :date, :date_start
    add_column :events, :date_end, :date
  end
end
