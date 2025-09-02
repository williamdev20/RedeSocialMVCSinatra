require_relative "../models/user"

class RegisterController < Sinatra::Base
  set :views, Proc.new {File.join(root, "../views/register")}

  get '/register' do
    erb :index
  end

  post '/register' do
    begin
      User.create(name: params[:name], email: params[:email], password: params[:password])
      redirect '/login'
    rescue Sequel::UniqueConstraintViolation
      "Esse usuário já existe!"
    end
  end
end