class Profile < ActiveRecord::Base
  belongs_to :user
  validate :has_at_least_first_or_last_name?
  validate :no_men_named_sue

  validates :gender, inclusion: { in: %w(male female)}

  def has_at_least_first_or_last_name?
    unless (first_name.present? || last_name.present?)
      errors.add(:first_name, "Both first and last name must be present")
    end
  end

  def no_men_named_sue
    if (first_name == "Sue" && gender == "male")
      errors.add(:gender, "Someone doesn't love johnny cash")
    end
  end

  def self.get_all_profiles min_year, max_year
    Profile.all.where("birth_year between :min_year and :max_year", min_year: min_year, max_year: max_year).order(:birth_year)
  end
end
