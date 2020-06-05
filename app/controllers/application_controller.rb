require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, SecureRandom.hex(64)
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  @community = "Flatiron School Project RP"

  get "/" do
    logged_in_user_id = session[:user_id]
    @member = Member.find_by(id: logged_in_user_id)
    erb :"index"
  end


  helpers do

    def logged_in
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

  end


end
