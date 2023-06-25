class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.date :start_date
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
