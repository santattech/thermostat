class ThermoStatSerializer < ResourceSerializer
  attributes :household_token, :location

  belongs_to :reading
end
