class Submission < ApplicationRecord
  enum kind: {
    manual_sampling_cost: 10,
    tanks_increased_turnover_potential: 20
  }

  enum state: {
    pending: 0,
    sent: 50,
    done: 100,
    failed: 500
  }

  def name
    "#{created_at} - #{state} - #{kind.camelize}"
  end

  def properties
    attributes.slice(*%w[
      roi_number_of_fermenters
      roi_weekly_manual_sampling_per_fermenter
      roi_per_samples_liquid_tapped_volume
      roi_salary_per_hour
      roi_minutes_per_sample
      roi_average_revenue_per_liquid_unit
      roi_money_spent_on_manual_sampling
      roi_manual_sampling_time_lost
      roi_manual_sampling_liquid_lost
      roi_total_capacity
      roi_total_capacity_unit
      roi_batches_count_per_year_per_fermenter
      roi_normal_fermentation_cycle_length
      roi_hours_saved_per_batch
      roi_revenue_per_liquid_unit
      roi_production_increase_percent
      roi_production_increase_sales
      roi_currency
      roi_liquid_unit
    ])
  end
end
