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
      max_humidity = readings.map(&:humidity).compact.max
      min_humidity = readings.map(&:humidity).compact.min

      max_t = readings.map(&:temperature).compact.max
      min_t = readings.map(&:temperature).compact.min

      max_b = readings.map(&:battery_charge).compact.max
      min_b = readings.map(&:battery_charge).compact.min
      render status: :ok, json: json_api_serializer_response(@current_thermo, meta: { max_temperature: max_t, min_temperature: min_t, max_battery_charge: max_b, min_battery_charge: min_b, max_humidity: max_humidity, min_humidity: min_humidity })
    else
      render_json_error(:not_found, message: "Thermostat not found")
    end
  end
end
