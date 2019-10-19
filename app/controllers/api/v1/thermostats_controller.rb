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
          #hash = { temp: params[:temperature], humidity: params[:humidity], battery_charge: params[:battery_charge] }
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
end
