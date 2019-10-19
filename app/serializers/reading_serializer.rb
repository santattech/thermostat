class ReadingSerializer < ResourceSerializer

  attributes :tracking_number, :thermostat_id

  belongs_to :thermostat

  attribute :temperature do |r|
    r.temp
  end

  attribute :battery_charge do |r|
    r.battery
  end

  attribute :humidity do |r|
    r.humid
  end
end
