%% Testing the implementation of Spotify API
% Connecting Application to Spotify API & Making request. 
% Class defined for direct contact with Spotify, while the SpotifyHandler
% communicates between the UI and this class.


classdef SpotifyAuthorization 
    properties (Access = private)
        
    end
    methods (Access = public)   
       
    end
    
    methods (Static) 
    
        % OPENS AUTHORIZATION WINDOW W/ AUTH CODE 
        % Input / Ouput : Nan
        function RequestAuthInAPI()
            client_id = "28ca2d3814414c08858c196d669a3838"; % Specific Application client id
            redirect_uri = 'https://hankhelmers.github.io/CPS_Project/';
            scope = 'playlist-read-private user-read-private user-read-email';
            response_type = 'code';                          % create URI obj
            
            % Authorization url
            auth_url = "https://accounts.spotify.com/authorize?";
            auth_url = strcat(auth_url, "client_id="+client_id);
            auth_url = strcat(auth_url, "&redirect_uri="+redirect_uri);
            auth_url = strcat(auth_url, "&response_type="+response_type);
           
            web(auth_url);
        end
        
        % INPUT: Post Auth URL - After opening 
        % Input the COPY-PASTE URL and returns the access code with in the
        % URL.
        function authCode = ParsePostAuthUrl(postAuthUrl) 
            import matlab.net.http.*
            import spotify.client.*;
            %post_auth_url = 'https://hankhelmers.github.io/CPS_Project/?code=AQDkK3AcQqCnoiV37f1Ied1DjOyEINjnzKB1HA-JO7c0HIyYL2VR0PGrbawMQiKkuquXUl7UlI19VaEvDp2jzxsOF_scEItkktas0voMUgc4p2q1W8i0Kx4a_i3KB0dB6AtRO_ruQWXCVto_9ZQLn_bqJ7soiGsYN_3rLO6nheky5_VREMdzi9IVlzQg0A';
        
            r = RequestMessage;
            resp = send(r,postAuthUrl);
            disp(resp)
        
            if(resp.StatusCode == "OK") 
                parseString = split(postAuthUrl, "=");
                authCode = parseString(2)
            end
        end
    end
end
