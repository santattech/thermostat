require 'rails_helper'
require "spec_helper"

RSpec.describe Reading, type: :model do
  describe "#temp" do
    let(:thermostat)    { create(:thermostat) }
    let!(:reading)    { create(:reading, thermostat_id: thermostat.id) }

    it { expect(reading.temp).to eq(reading.temperature) }
  end

  describe "#battery" do
    let(:thermostat)    { create(:thermostat) }
    let!(:reading)    { create(:reading, thermostat_id: thermostat.id) }

    it { expect(reading.battery).to eq(reading.battery_charge) }
  end

  describe "#humid" do
    let(:thermostat)    { create(:thermostat) }
    let!(:reading)    { create(:reading, thermostat_id: thermostat.id) }

    it { expect(reading.humid).to eq(reading.humidity) }
  end
end
