% FAILED ATTEMPT AT IMPLEMENTING THE FINAL STEP OF THE SPOTIFY
% AUTHORIZATION API.
% Because MATLAB doesn't support the data formatting that we need to send
% to Spotify to get a response this code is practicially useless.

%https://hankhelmers.github.io/CPS_Project/?code=
% access test url

import matlab.net.http.*;
import matlab.net.http.field.*;
import spotify.client.*;
import matlab.net.base64encode;

% Retrieved from copy & paste
auth_code = 'AQBVsxV83soIar44JtfkHI18K8CYtSP3to2pSALzhPXWcaDaCxwL3l3ALkFhlV4YB-Khq-SZ3AKNycV1FKBUf8EgLNd4Ut6PdcOexwKD8EivpDWIOtbl2lVhcrGq7dA0LGFsIepTZHFXt3X2KBuXzA-Cu32wW87xbWvtYwyQtb9whi3gHMe1qeoJZkdapQ';

%GET ACCESS TOKEN FROM CODE
redirect_uri = 'https://hankhelmers.github.io/CPS_Project/';
token_url = 'https://api.spotify.com/v1/api/token/';

token_url = strcat(token_url, "grant_type="+"authorization_code");
token_url = strcat(token_url, "&code="+auth_code);
token_url = strcat(token_url, "&redirect_uri="+redirect_uri);

disp(token_url)

%Authorization: Basic <base64 encoded client_id:client_secret>
client_id = "28ca2d3814414c08858c196d669a3838";
secret_id = "c3d8cd535bc64d0591202b7226649040";
encodedId = base64encode(strcat(client_id, ":", secret_id));

disp(encodedId);

headerField = HeaderField('Content-Type', 'application/x-www-form-urlencoded', "Authorization", strcat("Basic ", encodedId));

inputParameters = struct('grant_type', "authorization_code", "code", auth_code, "redirect_uri", redirect_uri);
aTest = jsonencode(inputParameters);

options = HTTPOptions();
messageString = strcat('grant_type=authorization_code&code=',auth_code,'&redirect_uri=',redirect_uri)

request = RequestMessage(); 
request.Method = RequestMethod.POST;
request.Body = MessageBody(messageString);
request.Header = HeaderField('Content-Type', 'application/x-www-form-urlencoded');
show(request)

options = options();
options.Credentials = AuthInfo("Authorization", strcat("Basic ", encodedId))
disp(options)

resp = request.send(token_url, options);
disp(resp)

% USER_PROFILE = 'https://api.spotify.com/v1/me/playlists';
% %"Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer "
% options = weboptions('HeaderFields', {'Accept' 'application/json';'Content-Type' 'application/json';'Authorization' strcat('Bearer ', auth_token)})
% 
% resp = webread(USER_PROFILE, options);
% disp(resp)

% GET /v1/me HTTP/1.1
% Content-Type: application/json
% Authorization: 
% Host: api.spotify.com

% https://api.spotify.com/v1/me/Content-Type=application/json&Authorization=AQDYj6DAoeXOVH88crWVI5rIiVWPTg1SUaqNYMAxhFhvf7NP_R9GItJ5go31DoZbdyKH88hVr7rE1HIG8aIrIdWfY5gOGsjYhVd2pWXG4P8n8F3I5j33TysbTMJr_w9_Jd9sWkV2spC9TuFytRs1hdCLTjPhGNWrfeDCWGlKh7TfaVBTBWnnG2uDvWYguSet7ueq0N6S9kNOxf_9yg