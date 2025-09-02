require_relative "../models/user"

class LoginController < Sinatra::Base
  set :views, Proc.new {File.join(root, "../views/login")}

  get '/login' do
    erb :index
  end

  post '/login' do
    @nameLogin = params[:name]
    @emailLogin = params[:email]
    @passwordLogin = params[:password]

    user = User.where(name: @nameLogin).first

    if user && user.email == @emailLogin && user.password == @passwordLogin
      session[:user_id] = user.id
      redirect "/#{user.name}"
    else
      "Dados inválidos"
    end

  end
end