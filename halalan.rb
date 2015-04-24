#!/usr/bin/env ruby
# encoding: UTF-8
require 'sinatra'
require 'sinatra/sequel'
require 'sinatra/content_for'
require 'bcrypt'
require 'slim'
require 'pg'

configure do
  set :database, ENV['HEROKU_POSTGRESQL_VIOLET_URL'] || 'postgres://localhost/upacmdb'
  #require "./config/migrations"
  require "./config/data"

  ENV['TZ'] = 'Asia/Manila'

  enable :sessions
  set :session_secret, '$2a$10$NYB.Sk0xxjDIpTvztIAn7.8Max3BXCLLnEzTSUZ3ghM2.PHAD3c0G'
  set :admins, [137, 140, 135, 136, 141]
end

# The app
set :slim, :pretty => true

helpers do
  def logged_in?() session[:token] end
  def failed_login?() session[:failed_login] end
  def nickname() session[:nickname] end
  def is_admin?() settings.admins.include? session[:userid] end
end

before do
  @positions ||= Position.all
  @candidates ||= Candidate.to_hash_groups(:positionid)
  @user ||= User[session[:userid]]
end

get '/' do
  slim :results
end

get '/blueparrot' do
  @votes ||= Vote.to_hash_groups(:candidateid)
  @abstains ||= Abstain.to_hash_groups(:positionid)
  @users ||= User.where(:has_voted => 't').order(:voted_on)
  slim :blueparrot
end

get '/candidate_:id' do |page|
  slim page.to_sym
end

get '/login' do
  slim :index
end

post '/login' do
  user ||= User.filter(:email => params[:email]).first
  pass unless user

  user_hash = BCrypt::Password.new(user.hashed_password)
  pass unless user_hash == params[:password]

  session[:token] = BCrypt::Engine.generate_salt()
  session[:userid] = user.id
  session[:nickname] = user.nickname
  session[:failed_login] = false

  redirect '/'
end

post '/login' do
  session[:failed_login] = true
  redirect '/login'
end

get('/logout') do
  session.clear
  redirect '/'
end

post '/submit' do
  redirect '/' unless @user
  redirect '/vote' if @user.has_voted

  params.each do |candidate|
    if candidate[1] == 'on'
      abstain = Abstain.create(
        :positionid => candidate[0]
      )
    else
      vote = Vote.create(
        :candidateid => candidate[1]
      )
    end
  end

  @user.has_voted = true
  @user.ip_address = request.ip
  @user.voted_on = Time.now
  @user.save
  redirect '/vote'
end

not_found do
  'lol u lost gurl'
end
