# airwatch_app

AirWatch App is a mobile app that provides real-time information about air quality levels using the AirQuality API

## Getting Started

The app helps users make informed decisions and take necessary precautions for their health and well-being based on the air quality in their area.
This apps follows DDD and Clean Code guidelines.


### Data Layer
For this application I'll be hitting the [Air Quality Open Data Platform API](https://aqicn.org) 
Endpoint: https://api.waqi.info/feed/{city}/?token={token}

The AirQuality API client is created as an internal package so that it can be reused in other projects or even published on [pub.dev](https://pub.dev/)

### Repository Layer
The Repository layer abstracts our data layer and communicates with the Domain layer. This makes it easier to change our data provider without affecting the application-level code.

### Domain Layer
I will be consuming AirQualityStatus domain model from the AirQualityStatusRepository and exposing a feature-level model which will be surfaced to the user via the UI.

### Presentantion Layer
The presentation layer consists of a first screen where we randomly trigger the request for air quality data of a random city, which takes us to a second screen where we obtain the subsequent data after the api call.

### Unit and Widget tests
Full unit tests have been included for the data layer, along with additional tests in different parts for demonstration purposes. Widget tests have also been added for the screen that returns successful results.

