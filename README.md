# Thermostats API
An API based application using a lightning fast JSON:API serializer for Ruby Objects

## Requirements
This project currently works with:

* Rails 5.2.2
* Ruby 2.5.3
* PostgreSQL
* Redis

## Setting up development
  * cd thermo
  * install ruby 2.5.3 (using rvm)
  * bundle
  * create config/database.yml
  * rake db:create
  * rake db:migrate
  * rake db:seed # to store dummy data

#### Running development env:
  * cd thermo
  * rails s

#### Running test env:
  * rake db:schema:load RAILS_ENV=test
  * rspec spec/

## The API URLs

#### POST reading: collects temperature, humidity and battery charge from a particular thermostat.

`curl --request POST \
  --url http://localhost:3000/api/v1/thermostats/reading \
  --header 'authorization: qwerty' \
  --header 'content-type: application/json' \
  --data '{
	"temperature": "0.5",
	"battery_charge": "5",
	"humidity": 85
}'`

#### GET Reading: returns the thermostat reading data by the tracking number obtained from POST Reading.

`
curl --request GET \
  --url http://localhost:3000/api/v1/thermostats/reading \
  --header 'authorization: qwerty' \
  --header 'content-type: application/json' \
`

#### GET Stats: gives the average, minimum and maximum by temperature, humidity and battery_charge in a particular thermostat across

`
  curl --request GET \
  --url http://localhost:3000/api/v1/thermostats/stats \
  --header 'authorization: qwerty' \
  --header 'content-type: application/json' \
  `
