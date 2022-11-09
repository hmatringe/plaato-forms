class AddFieldsToSubmission < ActiveRecord::Migration[6.1]
  def change
    add_column :submissions, :roi_number_of_fermenters, :string
    add_column :submissions, :roi_weekly_manual_sampling_per_fermenter, :string
    add_column :submissions, :roi_per_samples_liquid_tapped_volume, :string
    add_column :submissions, :roi_salary_per_hour, :string
    add_column :submissions, :roi_minutes_per_sample, :string
    add_column :submissions, :roi_average_revenue_per_liquid_unit, :string
    add_column :submissions, :roi_money_spent_on_manual_sampling, :string
    add_column :submissions, :roi_manual_sampling_time_lost, :string
    add_column :submissions, :roi_manual_sampling_liquid_lost, :string
    add_column :submissions, :roi_total_capacity, :string
    add_column :submissions, :roi_batches_count_per_year_per_fermenter, :string
    add_column :submissions, :roi_normal_fermentation_cycle_length, :string
    add_column :submissions, :roi_hours_saved_per_batch, :string
    add_column :submissions, :roi_revenue_per_liquid_unit, :string
    add_column :submissions, :roi_production_increase_percent, :string
    add_column :submissions, :roi_production_increase_sales, :string
    add_column :submissions, :roi_currency, :string
    add_column :submissions, :roi_liquid_unit, :string
  end
end
