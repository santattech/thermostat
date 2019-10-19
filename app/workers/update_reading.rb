class UpdateReading
  include Sidekiq::Worker
  sidekiq_options queue: :update_reading

  def perform(id, temp, humidity, battery_charge)
    begin
      reading = Reading.find_by(id: id)
      reading.temperature = temp
      reading.humidity = humidity
      reading.battery_charge = battery_charge
      reading.save
      redis = Redis.new(host: 'localhost', port: 6379)
      redis.del("b-#{reading.id}")
      redis.del("t-#{reading.id}")
      redis.del("h-#{reading.id}")
    rescue => e
      messages = e.backtrace.join("\n")
      logger.error("Background job error in UpdateReading: #{messages}")
    end
  end
end
