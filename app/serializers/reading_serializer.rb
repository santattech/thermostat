class ReadingSerializer < ResourceSerializer
  REDIS = Redis.new(host: 'localhost', port: 6379)
  attributes :tracking_number, :thermostat_id

  belongs_to :thermostat

  attribute :temperature do |r|
    r.temperature.presence || REDIS.get("t-#{r.id}")
  end

  attribute :battery_charge do |r|
    r.battery_charge.presence || REDIS.get("b-#{r.id}")
  end

  attribute :humidity do |r|
    r.humidity.presence || REDIS.get("h-#{r.id}")
  end
end
