# important library import
import requests


# creating Weather class
class Weather:
    # initialize the weather class with init method with parameter api_key, city and days with default value 1
    def __init__(self, api_key: str, city: str, days: int = 1):
        self.API_URL = 'https://api.weatherapi.com/v1/forecast.json'
        self.API_KEY = api_key
        self.CITY = city
        self.DAYS = days

    # creating get_data method to request the API URL and fetch the weather data
    def get_data(self):
        # creating params required for the API URL
        params = {
            "key": self.API_KEY,
            "q": self.CITY,
            "days": self.DAYS,
        }
        # fetching weather data
        response = requests.get(self.API_URL, params=params)
        # checking response status
        if response.status_code == 200:
            return response.json()
        else:
            response.raise_for_status()

    # creating filter method to filter weather data based on requirement
    def filter(self):
        # creating dict to store filtered weather data
        weather_data = {}
        # Creating list to store forecast weather data
        forecast = []
        # checking no of days to forecast weather data based on days
        if self.DAYS == 1:
            weather_data['city'] = self.get_data()['location']['name']
            weather_data['temperature'] = self.get_data()['current']['temp_c']
            weather_data['humidity'] = self.get_data()['current']['humidity']
            weather_data['pressure'] = self.get_data()['current']['pressure_mb']
            weather_data['weather_description'] = self.get_data()['current']['condition']['text']
            return weather_data
        elif 1 < self.DAYS < 8:
            for i in self.get_data()['forecast']['forecastday']:
                forecast.append(
                    {'date': i['date'], 'min_temp': i['day']['mintemp_c'], 'max_temp': i['day']['maxtemp_c'],
                     'humidity': i['day']['avghumidity'], 'weather_description': i['day']['condition']['text']})
            weather_data['city'] = self.get_data()['location']['name']
            weather_data['forecast'] = forecast
            return weather_data
        else:
            return 'Max 7 days Allowed'