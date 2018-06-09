class SalaryRange < ActiveRecord::Base
  belongs_to :job

  validate :min_less_than_max

  def min_less_than_max
    if min_salary > max_salary
      errors.add(:min_salary, "cannot be greater than maximum salary")
  end
end
