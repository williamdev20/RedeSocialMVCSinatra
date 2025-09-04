require_relative "../models/post"
require_relative "../models/user"

class PostController < Sinatra::Base
  
  set :views, Proc.new {File.join(root, "../views/post")}

  # Manda pra tela de login se ainda não tiver feito um cadastro
  # before "/:name" do
  #   @user = User.where(name: params[:name]).first
  #   redirect '/login' unless session[:user_id]
  # end

  # READ
  get '/:name' do
    @user = User.where(name: params[:name]).first
    halt 404, "Usuário não encontrado" unless @user

    @posts = Post.where(user_id: @user.id).all
    erb :index
  end

  # CREATE
  get '/:name/create' do
    @user = User.where(name: params[:name]).first
    halt 404, "Usuário não encontrado" unless @user

    erb :create
  end

  post '/:name/create' do
    @user = User.where(name: params[:name]).first
    Post.create(user_id: @user.id ,title: params[:title], content: params[:content])
    redirect "/#{@user.name}"
  end

  # UPDATE
  get '/:name/edit/:id' do
    @user = User.where(name: params[:name]).first
    halt 404, "Usuário não encontrado!" unless @user

    @post = Post.where(id: params[:id], user_id: @user.id).first
    halt 404, "Post não encontrado!" unless @post

    erb :edit
  end

  # Para usar PUT tem que fazer uma configuração (mesma coisa pro delete)
  post '/:name/edit/:id' do
    @user = User.where(name: params[:name]).first
    halt 404, "Usuário não encontrado!" unless @user

    @post = Post.where(id: params[:id], user_id: @user.id).first
    halt 404, "Post não encontrado!" unless @post

    @post.update(title: params[:title], content: params[:content])
    redirect "/#{@user.name}"
  end

  # DELETAR
  delete '/:name/delete/:id' do
    @user = User.where(name: params[:name]).first
    halt 404, "Usuário não encontrado!" unless @user

    @post = Post.where(id: params[:id], user_id: @user.id).first
    halt 404, "Post não encontrado!" unless @post

    @post.delete
    redirect "/#{@user.name}"

  end

end