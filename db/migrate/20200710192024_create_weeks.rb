class CreateWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :weeks do |t|
      t.string :start_of_week
      t.string :end_of_week

      t.timestamps
    end
  end
end
