class Reading < ApplicationRecord
  REDIS = Redis.new(host: 'localhost', port: 6379)
  belongs_to :thermostat

  def temp
    self.temperature.presence || REDIS.get("t-#{id}")
  end

  def battery
    self.battery_charge.presence || REDIS.get("b-#{id}")
  end

  def humid
    self.humidity.presence || REDIS.get("h-#{id}")
  end
end
