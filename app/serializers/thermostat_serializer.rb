class ThermostatSerializer < ResourceSerializer
  attributes :household_token, :location

  has_many :readings
end
