class CreateDives < ActiveRecord::Migration
  def change
    create_table :dives do |t|
      t.string :locationName
      t.date :diveDate
      t.integer :pressureIn
      t.integer :pressureOut
      t.integer :actualBottomTime
      t.time :timeIn
      t.time :timeOut
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :dives, :users
  end
end
