class UsersController < ApplicationController
  before_action :authenticate, except: [:login, :create]

   #POST /api/user login
  def login
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate( user_params[:password])
      token = token(user.id, user.username)
      render json: {status: 201, token: token, user: user}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

   #POST /api/create user
  def create
     user = User.new(user_params)
     if user.save
       render json: {status: 200, message: "ok"}
     else
       render json: {status: 422, user: user.errors}
     end
   end

   #GET /api/allUsers
   def index
     allUsers = User.select("id, username, email, e_confirmed")
     render json: allUsers
   end

   #GET /api/allUsers
   def show
     user = User.find(params[:id])
     render json: {status: 200, user: user}
   end

   #PATCH/PUT /api/update user
   def update
     user = User.find(params[:id])
     #if user.id === logged_user['id']  # uncomment to restict user update
       if user.update(user_params)
         render json: user
       else
         render json: user.errors, status: :unprocessable_entity
       end
     #else                              # uncomment to restict user update
       #render json: {status: 401, message: 'Profile can only be update by owner' }
     #end                               # uncomment to restict user update ^^^ also
   end

  private

    def token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
      {
        exp: (Time.now + 1.day).to_i, # Expiration date 24 hours from now
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end

    def user_params
      params.required(:user).permit(:username, :password, :email, :e_confirmed)
    end

end
