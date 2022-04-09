%% Testing the implementation of Spotify API
% Connecting Application to Spotify API & Making request. 

classdef Spotify_Authorization 
    properties (Access = private)
        
    end

    methods (Access = public)   
       
    end

    methods (Static) 
        % Opens request for the url
        function Request_Auth_In_API()
            auth_code = '';
           
            client_id = "28ca2d3814414c08858c196d669a3838"; % Specific Application client id
            redirect_uri = 'https://hankhelmers.github.io/CPS_Project/';
            scope = 'user-read-private user-read-email';
            response_type = 'code';                          % create URI obj
            
            % Authorization url
            auth_url = "https://accounts.spotify.com/authorize?";
            auth_url = strcat(auth_url, "client_id="+client_id);
            auth_url = strcat(auth_url, "&redirect_uri="+redirect_uri);
            auth_url = strcat(auth_url, "&response_type="+response_type);
           
            web(auth_url);
        end
        
        function auth_code = Parse_Post_Auth_Url(post_auth_url) 
            import matlab.net.http.*
            import spotify.client.*;
            %post_auth_url = 'https://hankhelmers.github.io/CPS_Project/?code=AQDkK3AcQqCnoiV37f1Ied1DjOyEINjnzKB1HA-JO7c0HIyYL2VR0PGrbawMQiKkuquXUl7UlI19VaEvDp2jzxsOF_scEItkktas0voMUgc4p2q1W8i0Kx4a_i3KB0dB6AtRO_ruQWXCVto_9ZQLn_bqJ7soiGsYN_3rLO6nheky5_VREMdzi9IVlzQg0A';
        
            r = RequestMessage;
            resp = send(r,post_auth_url);
            disp(resp)
        
            if(resp.StatusCode == "OK") 
                parseString = split(post_auth_url, "=");
                auth_code = parseString(2)
            end
        end
    end
end
