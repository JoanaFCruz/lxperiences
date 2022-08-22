class RemoveDates < ActiveRecord::Migration[7.0]
  def change
    remove_column(:experiences, :start_date)
    remove_column(:experiences, :end_date)
  end
end
