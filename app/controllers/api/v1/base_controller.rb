class Api::V1::BaseController < ApplicationController
  before_action :login_required

  protected

  def login_required
    unless logged_in?
      render_json_error(:unauthorized, message: "Valid household token required")
    end
  end

  def logged_in?
    current_thermo
  end

  def current_thermo
    return @current_thermo if @current_thermo

    unless @current_thermo == false
      @current_thermo ||= if auth_present?
                            Thermostat.find_by(household_token: token)
                          end
    end
  end

  def token
    @token ||= if request.headers['Authorization'].present?
                 request.headers['Authorization'].split(' ').last
               end
  end

  def auth_present?
    !!request.headers['Authorization'].split(' ').last
  end
end
