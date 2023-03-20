class DroptimesheetsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :timesheets
  end
  def down
    create_table :timesheets do |t|
      t.datetime :in
      t.datetime :out
      t.time :duration
  
      t.timestamps
      end
  end

end
