# airwatch_app

AirWatch App is a mobile app that provides real-time information about air quality levels using the IQAir API

## Getting Started

The app helps users make informed decisions and take necessary precautions for their health and well-being based on the air quality in their area.
This apps follows DDD and Clean Code guidelines.


### Data Layer
For this application I'll be hitting the [Air Quality Open Data Platform API](https://www.iqair.com) 

Endpoint: https://api.waqi.info/feed/{city}/?token={token}

The AirQuality Api client is created as a internal package so it could be reused in another project or even published on [pub.dev](https://pub.dev/)


### Repository Layer
Repository layer is to abstract our data layer and communicate with bloc layer. It will be easier to change our data provider without affects application-level code.



