class Person < ActiveRecord::Base
  has_one :personal_info, dependent: :destroy
  has_many :jobs, dependent: :destroy
end
