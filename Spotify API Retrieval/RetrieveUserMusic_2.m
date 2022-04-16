
client_id = '28ca2d3814414c08858c196d669a3838';
client_secret = 'c3d8cd535bc64d0591202b7226649040';
url = 'https://api.spotify.com/v1/api/token/';
redirect_uri = 'https://hankhelmers.github.io/CPS_Project/';
code = 'AQBVsxV83soIar44JtfkHI18K8CYtSP3to2pSALzhPXWcaDaCxwL3l3ALkFhlV4YB-Khq-SZ3AKNycV1FKBUf8EgLNd4Ut6PdcOexwKD8EivpDWIOtbl2lVhcrGq7dA0LGFsIepTZHFXt3X2KBuXzA-Cu32wW87xbWvtYwyQtb9whi3gHMe1qeoJZkdapQ';

data = [...
 'redirect_uri=', redirect_uri,... 
 '&client_id=', client_id,...
 '&client_secret=', client_secret,...
 '&grant_type=', 'authorization_code',...
 '&code=', code];
response = webwrite(url,data)

%access_token = response.access_token;
%webread('https://yoururlhere.com',options)

% % save access token for future calls
% headerFields = {'Authorization', ['Bearer ', access_token]};
% options = weboptions('HeaderFields', headerFields, 'ContentType','json');
