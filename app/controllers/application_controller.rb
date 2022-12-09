class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
       # payload => { beef: 'steak' }
    JWT.encode(payload, 'my_s3cr3t')
    # jwt string: "eyJhbGciOiJIUzI1NiJ9.eyJiZWVmIjoic3RlYWsifQ._IBTHTLGX35ZJWTCcY30tLmwU9arwdpNVxtVU0NpAuI"
    end

    def auth_header
        # headers: { 'Authorization': 'Bearer <token>' }
        request.headers['Authorization']
    end

    def decoded_token(token) 
        if auth_header
            token = auth_header.split('')[1]
            # headers: { 'Authorization': 'Bearer <token>' }
            begin
                JWT.decode(token, 'my_s3cr3t', true: algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
                
            end
        end
    end

    def current_user
        if decoded_token
            # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
            # or nil if we can't decode the token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
    end
end


    # In essence, when a user wishes to access a protected route or resource, our browser will send the JWT, typically in the auth header 

    # Authorization: Bear <token>
    # The corresponding fetch req might look like:

/
fetch("http://localhost:3000/api/v1/profile", {
    method: "GET",
    headers: {
      Authorization: `Bearer <token>`,
    },
});
/

# We can now set up our server to anticipate a JWT sent along in req headers, intesad of passign the token directly to ApplicationConroller#decoded_token
  
end
