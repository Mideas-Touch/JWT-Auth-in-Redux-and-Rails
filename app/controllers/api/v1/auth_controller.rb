class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only:[:create]

    def create
        @user = User.find_by(username: user_login_params[:username])
        #User#authenticate comes from BCrypt
        if @user && @user.authenticate
            (user_login_params[:password])
            # encode token comes from ApplicationController
            token = encode_token({ user_id: @user.id})
            render json: {user: UserSerializer.new(@user), jwt: token}, status: :accepted
        end
    end

    private

    def user_login_params
        # params { user: {username: 'Chandler Bing', password: 'hi' } }
        params.require(:user).permit(:username, :password)
    end

    # We can call our ApplicationController#encode_token method, passing the found user's ID in a payload.
    # The newly created JWT can then be passed back along with the user's data.
    # This user's data can be stored in our app's state e.g. React or REdux, while the token can be stored client side

    # NOTE: in the method
    # @user = User.find_by(username: params[:username])

    # If @user is nil, ruby will not attempt to call @user.authenticate

    #We need to send a JWT with every authenticated request
    
    # A sample request might look like:

    /


const token = localStorage.getItem("jwt");

fetch("http://localhost:3000/api/v1/profile", {
  method: "GET",
  headers: {
    Authorization: `Bearer ${token}`,
  },
});
/

# To do this, we need to update our UsersController so that an authenticated user can access their profile info

if @user && @user.authenticate(params[:password])
end


end
