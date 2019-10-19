class Reading < ApplicationRecord
  REDIS = Redis.new(host: 'localhost', port: 6379)
  belongs_to :thermostat

  def temp
    self.temperature.presence || REDIS.get("t-#{id}").to_f
  end

  def battery
    self.battery_charge.presence || REDIS.get("b-#{id}").to_f
  end

  def humid
    self.humidity.presence || REDIS.get("h-#{id}").to_f
  end
end
