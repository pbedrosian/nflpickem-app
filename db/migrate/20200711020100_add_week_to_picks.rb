class AddWeekToPicks < ActiveRecord::Migration[6.0]
  def change
    add_column :picks, :week_id, :integer
  end
end
