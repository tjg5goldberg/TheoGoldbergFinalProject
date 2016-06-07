require 'sinatra'
require 'sinatra/activerecord'

configure(:development){set :database, {adapter: “sqlite3”, database: “blog.sqlite3”}}

require './models'

set :sessions, true

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
		puts "\n\n \t#{@current_user.username}, #{@current_user.id} \n\n"
	end
end

get '/' do
	erb :sign_up
end

get '/sign-in' do
	erb :sign_in
end

post '/sign-in-process' do
  	@user = User.where(username: params[:username]).first
  if @user.password = params[:password]
	session[:user_id] = @user.id
	puts "\n\n \t#{session[:user_id]}, #{@user.username} \n\n"
    redirect "/welcome"
  else
    redirect "/"
  end
end

get '/index' do
	erb :index
end

post '/sign-up-process' do
	User.create(username: params[:username], password: params[:password])
	Profile.create(fname: params[:fname], lname: params[:lname], user_id: User.find_by_username(params[:username]).id)
	redirect('/sign-in')
end

get '/welcome' do
	current_user
	@current_user.id
	@username = @current_user.username
	erb :welcome
end

get '/posts' do
	current_user
	@username = @current_user.username
	erb :posts
end

post '/posts_process' do
	current_user
	@username = @current_user.username
	Post.create(text: params[:text])
	redirect('/posts_page')
end

get '/followers' do 
	current_user
	@username = @current_user.username
	erb :followers
end

get '/find_followers' do
	current_user
	@username = @current_user.username
	erb :find_followers
end

post '/find-followee-process' do
	current_user
	@username = @current_user.username
		if(!User.find_by_fname_and_lname_and_username(params[:fname], params[:lname],params[:username]).blank?)	
	redirect "/profile?id=#{user_id}"
		if (params[:id].blank?) 
			@id = current_user.id
		else
			@id = params[:id]
		end
	end
end