class Api::V1::ThermostatsController < Api::V1::BaseController

  def reading
    if params[:temperature].blank? || params[:humidity].blank? || params[:battery_charge].blank?
      render_json_error(:bad_request, message: "Temparature, humidity, battery charge can not be blank.")
      return
    end

    if @current_thermo
      thermostat = @current_thermo
      count = thermostat.readings.count
      reading = thermostat.readings.create(tracking_number: count + 1)

      if reading.persisted?
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
