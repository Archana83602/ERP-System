class CreateTimesheets < ActiveRecord::Migration[7.0]
  def change
    create_table :timesheets do |t|
      t.datetime :in
      t.datetime :out
      t.time :duration

      t.timestamps
    end
  end
end
