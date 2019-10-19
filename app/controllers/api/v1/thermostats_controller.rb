class Api::V1::ThermostatsController < Api::V1::BaseController

  def reading
    if request.get?
      if @current_thermo
        thermostat = @current_thermo
        render status: :ok, json: json_api_serializer_response(thermostat, include: [:readings])
      else
        render_json_error(:not_found, message: "Thermostat not found")
      end
    else
      if params[:temperature].blank? || params[:humidity].blank? || params[:battery_charge].blank?
        render_json_error(:bad_request, message: "Temparature, humidity, battery charge can not be blank.")
        return
      end

      if @current_thermo
        thermostat = @current_thermo
        count = thermostat.readings.count
        reading = thermostat.readings.create(tracking_number: count + 1)

        if reading.persisted?
          redis = Redis.new(host: 'localhost', port: 6379)
          redis.set("t-#{reading.id}", params[:temperature])
          redis.set("h-#{reading.id}", params[:humidity])
          redis.set("b-#{reading.id}", params[:battery_charge])

          UpdateReading.perform_async(reading.id, params[:temperature], params[:humidity], params[:battery_charge])
          render status: :created, json: json_api_serializer_response(reading)
        else
          render_json_error(:not_found, object: reading)
        end
      else
        render_json_error(:not_found, message: "Thermostat not found")
      end
    end
  end

  def stats
    if @current_thermo
      readings = @current_thermo.readings
      humid_array = readings.map{ |r| r.humid.to_f }
      max_humidity = humid_array.max
      min_humidity = humid_array.min
      avg_humid = humid_array.inject{ |sum, el| sum + el }.to_f / humid_array.size

      temp_array = readings.map{|r| r.temp.to_f }
      max_t = temp_array.max
      min_t = temp_array.min
      avg_temp = temp_array.inject{ |sum, el| sum + el }.to_f / temp_array.size

      battery_array = readings.map{|r| r.battery.to_f }
      max_b = battery_array.max
      min_b = battery_array.min
      avg_b = battery_array.inject{ |sum, el| sum + el }.to_f / battery_array.size

      render status: :ok, json: json_api_serializer_response(@current_thermo, meta: { max_temperature: max_t, min_temperature: min_t, average_temperature: avg_temp, max_battery_charge: max_b, min_battery_charge: min_b, average_battery: avg_b, max_humidity: max_humidity, min_humidity: min_humidity, average_humidity: avg_humid })
    else
      render_json_error(:not_found, message: "Thermostat not found")
    end
  end
end
