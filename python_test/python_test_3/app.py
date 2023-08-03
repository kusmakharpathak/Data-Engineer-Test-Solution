# important library import
from flask import Flask, jsonify
from weather_forecast import Weather

# creating flask app
app = Flask(__name__)

# API Key to fetch weather data
API_KEY = '9c90dd635315430f81a94631230308'


# Creating weather view with url prefix /weather/city
@app.route('/weather/<city>')
def get_weather(city):
    weather_api = Weather(API_KEY, city)
    forecast_data = weather_api.filter()
    return jsonify(forecast_data)


# Creating weather forecast view with url prefix /forecast/city
@app.route('/forecast/<city>')
def get_weather_forecast(city):
    weather_api = Weather(api_key=API_KEY, city=city, days=7)
    forecast_data = weather_api.filter()
    return jsonify(forecast_data)


# running the flask server
if __name__ == '__main__':
    app.run(debug=True)
