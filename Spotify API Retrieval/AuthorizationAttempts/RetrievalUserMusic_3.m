import matlab.net.http.*
import matlab.net.http.field.*


token = 'BQDjfdzSfL_KjtKg8uxEu9j8rhQa-AftTOA_xBHvDpniKmKVerzIIK6CPHBv84Ez7Z4UobkCjT3-1BteWyZkQ_qjbcNOlSMQq7BymtVP_C3RsJJB_JKfaDY-lgzSzUkhVKv9VOkb4By0Mt1eYA0-EjnUSJEUcZqjkhLKugPS'
authString = strcat("Bearer ", token)

% 
% r= weboptions('RequestMethod','get','ContentType','json');
% r.HeaderFields = ['Authorization : ' authString]
% %r.HeaderFields = 'HeaderFields',{'Authorization',  ['Bearer ' token]};
% 
% response = webread('https://api.spotify.com/v1/users/312nnyvxbjad5ivaggj6y2jlyy2u/playlists', r);

header = GenericField("Authorization", authString);
r = RequestMessage('GET', header)
data = send(r, 'https://api.spotify.com/v1/users/312nnyvxbjad5ivaggj6y2jlyy2u/playlists')
disp(data)