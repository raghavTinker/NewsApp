import flask
from flask import render_template, request, jsonify
from getCountry import getCountry


"""Take input of latitude and longitude and return the country"""
app = flask.Flask(__name__)
@app.route('/')
def index():
    return "raghavTinker is a moron. He has some apis"

@app.route('/country') 
def country():
    if len(request.args) == 0:
        return jsonify({"country" : "us"})
    latitude = request.args["lat"]
    longitude = request.args["long"]
    country = getCountry(latitude, longitude)

    if country is None:
        return jsonify({"country" : "us"})
    else:
        return jsonify({"country" : str(country)})

if __name__ == "__main__":
    app.run(ssl_context='adhoc')
