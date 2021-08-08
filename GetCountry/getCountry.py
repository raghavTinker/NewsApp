from geopy.geocoders import Nominatim


def getCountry(latitude, longitude) -> {str : str}:
    geolocator = Nominatim(user_agent="CountryName")

    location = geolocator.reverse(latitude + ", " + longitude)
    print(location.raw["address"]["country"])
    try:
        return {"country" : location.raw["address"]["country_code"], "country_name" : location.raw["address"]["country"]}
    except:
        return {"country" : "us", "country_name" : "USA"}