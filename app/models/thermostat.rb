class Thermostat < ApplicationRecord
  has_many :readings

  validates_uniqueness_of :household_token
end
