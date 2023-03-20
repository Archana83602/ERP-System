class CreateWorkhours < ActiveRecord::Migration[7.0]
  def change
    create_table :workhours do |t|
      t.boolean :type
      t.datetime :time
      t.date :date

      t.timestamps
    end
  end
end
