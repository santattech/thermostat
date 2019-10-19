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
    rescue => e
      messages = e.backtrace.join("\n")
      logger.error("Background job error in UpdateReading: #{messages}")
    end
  end
end
