# PYTHON SCRIPT THAT TAKES IN THE AUTH CODE FROM THE URL AND SENDS THE LAST 
# REQUEST TO SPOTIFY TO GET THE ACCESS TOKEN REQUIRED FOR ALL DATA RETRIVALS

#!/usr/bin/env python3

# Dependancies
import requests
import base64
import json

# URLS
AUTH_URL = 'https://accounts.spotify.com/authorize'
TOKEN_URL = 'https://accounts.spotify.com/api/token'
BASE_URL = 'https://api.spotify.com/v1/'

CLIENT_ID = '28ca2d3814414c08858c196d669a3838';
CLIENT_SECRET = 'c3d8cd535bc64d0591202b7226649040';

auth_code = "";
redirect_uri = 'https://hankhelmers.github.io/CPS_Project/';
scope = 'playlist-read-private user-read-private user-read-email';
response_type = 'code';     

def getTokenRequest(auth_code):
    idString = CLIENT_ID+ ":" +CLIENT_SECRET
    encodedId = base64.b64encode(idString.encode("ascii"))

    auth_response = requests.post(TOKEN_URL, 
        data={
        'grant_type': 'authorization_code',
        'code': auth_code,
        'redirect_uri': redirect_uri,
    }, headers={
        'Content-Type':'application/x-www-form-urlencoded',
        'Authorization':"Basic "+encodedId.decode("ascii")
    })

    # convert the response to JSON
    auth_response_data = auth_response.json()

    if(auth_response.status_code == 200):
        print(auth_response_data["access_token"]);
        return auth_response_data;
    else:
        print("ERROR: ")
        print(auth_response_data);
        return "ERROR"

getTokenRequest('AQCz6_vhfCK-Jk3EQLe32taHARjfXcr06_Xtj_VO_d5ffpizIHe0ur_mvi6iYvDpopBuRnMKLCM-MEVtVSKFSvUyexn2EJ737gZUamY7lTKxroByWCuHZwfpYTkYYUo_s7mW7yuEYyi1wOqrBXauGheZQDeXBAdd0MRYlO0WdrrHGhe9X4UbIgdAqR003g')


def getUserId():
    tokenData = getTokenRequest(auth_code)
    
    if(tokenData == "ERROR"):
        print("ERROR")

    token = tokenData["access_token"]
    #token = 'BQDOdkgGWbcoywc7qzzMEToHE3XdAh5w_NOsDuaAv_bKU_QTjVofTAvx6bDQphsO_9Zc1bzrWKJ8ijFyRsX9q6NKqj33xecH6gjmlH1xA34OVBHUVGdbBt3jRjsbTOPRHFTmFwkjl7czijspGL9IkXokv8HKG2igdFX32A'
    
    # GET /v1/me HTTP/1.1
    # Content-Type: application/json
    # Authorization: 
    # Host: api.spotify.com

    BASE_URL = 'https://api.spotify.com/v1/me'

    profile_response = requests.post(BASE_URL, 
        headers={
        'Content-Type':'application/json',
        'Authorization':"Bearer "+token
    })

    print(profile_response)


# getUserId()
