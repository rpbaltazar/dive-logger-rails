class RenameDiveTableColumnNames < ActiveRecord::Migration
  def change
    rename_column :dives, :locationName, :location_name
    rename_column :dives, :diveDate, :dive_date
    rename_column :dives, :pressureIn, :pressure_in
    rename_column :dives, :pressureOut, :pressure_out
    rename_column :dives, :actualBottomTime, :actual_bottom_time
    rename_column :dives, :timeIn, :time_in
    rename_column :dives, :timeOut, :time_out
  end
end
