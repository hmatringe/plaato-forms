class AddTotalCapacityUnitToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_column :submissions, :roi_total_capacity_unit, :string
  end
end
