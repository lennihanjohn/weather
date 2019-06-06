# Weather Forecast - Ruby on Rails Application

This application allows the user to fetch current weather for a address or city/state or zipcode from the OpenWeatherMap API and DarkSky API. Weather data is stored in the Rails backend (sqlite). 

## Installation

Clone down this repository. Run bundle and rails db:migrate from your terminal for the rails directory. From the rails directory, in the terminal call 'rails s' to launch the server. The application will be running on your localhost:3000 port.

In order for the weather portion of the application to work in production environment, you will need to get your own API key from the OpenWeatherMap API and DarkSky API and put them in an .env file at the root of the rails API repository with an APPID=YOURKEY (make sure there are no spaces or new lines after the key).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
