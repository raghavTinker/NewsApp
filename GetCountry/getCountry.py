from geopy.geocoders import Nominatim


def getCountry(latitude: float, longitude: float) -> str:
    geolocator = Nominatim(user_agent="CountryName")

    location = geolocator.reverse(latitude + ", " + longitude)
    try:
        return location.raw["address"]["country_code"]
    except:
        return "us"