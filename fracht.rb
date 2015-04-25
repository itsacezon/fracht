#!/usr/bin/env ruby
# encoding: UTF-8
require 'sinatra'
require 'sinatra/sequel'
require 'sinatra/content_for'
require 'bcrypt'
require 'slim'
require 'pg'
require 'sass'
require 'uifaces'

configure do
  set :database, ENV['HEROKU_POSTGRESQL_VIOLET_URL'] || 'postgres:///fracht'
  # require "./config/migrations"
  require "./config/data"

  ENV['TZ'] = 'Asia/Manila'

  set :scss, {:style => :compressed, :debug_info => false}

  enable :sessions
  set :session_secret, '$2a$10$NYB.Sk0xxjDIpTvztIAn7.8Max3BXCLLnEzTSUZ3ghM2.PHAD3c0G'
  set :admins, [137, 140, 135, 136, 141]
end

before do
  @user ||= User[session[:userid]]
end

get '/css/:name.css' do |name|
  content_type :css
  scss "sass/#{name}".to_sym, :layout => false
end

get '/' do
  if @user
    slim :shipments
  else
    slim :index
  end
end

get '/profile' do
  slim :profile
end

get '/shipments' do
  slim :shipments
end

get '/requests' do
  slim :requests
end

get '/requests/add' do
  slim :addrequest
end

get '/requests/add/:id' do
  slim :requestroute
end


get '/products' do
  @products = Dir['public/img/products/*.jpg']
  slim :products
end
get '/products/add' do
  slim :addproduct
end
get '/products/edit/:id' do
  slim :editproduct
end

get '/register' do
  slim :register
end
post '/register' do
  user = User.new
  user.name = params[:name]
  user.email = params[:email]
  user.home = params[:home]
  user.number = params[:number]
  user.type = params[:type]
  user.password  = BCrypt::Password.new(params[:password])
  user.save
end

get '/profile/:id' do
  if !@user
    redirect '/login'

  else
    if(user.type=="transporter")
      @assets ||= Asset[:owner => user.id]
    else
      @products ||= Deliverable[:owner => user.id]
    end
    slim :profile
  end

end

get '/shipments/' do
  @shipments ||= Transaction[:senderid => @user.id]
end

get '/login' do
  slim :login
end
post '/login' do
  user ||= User.filter(:email => params[:email]).first
  pass unless user

  user_hash = BCrypt::Password.new(user.password)
  pass unless user_hash == params[:password]

  session[:token] = BCrypt::Engine.generate_salt()
  session[:userid] = user.id
  session[:failed_login] = false

  redirect '/'
end
post '/login' do
  session[:failed_login] = true
  redirect '/login'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/message' do
  message = Message.new
  message.message = params[:message]
  message.from = @user.id
  message.to = params[:to]
  message.save
end

get '/message/' do
  @messages ||= Message.where(:to => @user.id).or(:from => @user)
end

post '/search' do
  @scheds ||= Schedule.filter(:from => params[:from],:to => params[:to]) #get all schedule same with search
  @assets ||= Asset.filter(:capacity => params[:capacity],:schedule => @scheds.id) #get all assets with the same sched as above
end

get '/routes' do
  slim :routes
end

get '/routes/add' do
  slim :addroute
end

get '/routes/edit/:id' do
  slim :editroute
end

post '/routes' do
  route = Route.new
  route.from = params[:from]
  route.to = params[:to]
  route.save
end

put '/editroutes' do
  route = Route[:id]
  route.from = params[:from]
  route.to = params[:to]
  route.save
end

put '/deleteroutes' do
  route = Route[:id]
  route.destroy
end

post '/product/' do
  deliverable = Deliverable.new
  deliverable.description = params[:description]
  deliverable.weight = params[:weight]
  deliverable.image = params[:image]
  deliverable.quantity = params[:quantity]
  deliverable.owner = @user.id
  deliverable.save
end

post '/product/edit/:id' do
  deliverable = Deliverable[:id]
  if(deliver.owner==@user.id)
    deliverable.description = params[:description]
    deliverable.weight = params[:weight]
    deliverable.image = params[:image]
    deliverable.quantity = params[:quantity]
    deliverable.save
  end

end

delete '/deletedeliverables' do
  deliverable = Deliverable[:id]
  if(deliver.owner==@user.id)
    deliverable.destroy
  end
end

post '/asset' do
  asset = Asset.new
  schedule = Schedule.new

  schedule.from = params[:from]
  schedule.to = params[:to]
  schedule.save

  asset.type = params[:type]
  asset.availability = true
  asset.ownerid = @user.id
  asset.capacity = params[:capacity]
  asset.schedule = schedule.id
  asset.save
end

put '/editasset' do
  asset = Asset[:id]
  if(asset.owner==@user.id)
    asset.type = params[:type]
    asset.availability = params[:availability]
    asset.capacity = params[:capacity]
    asset.schedule = params[:scheduleid]
    asset.save
  end
end

delete '/deleteasset' do
  asset = Asset[:id]
  asset.destroy
end

post '/assetroute' do
  assetroute = AssetRoute.new
  assetroute.assetUsed = params[:assetid]
  assetroute.assetRoute = params[:routeid]
  assetroute.save
end

put '/editassetroute' do
  assetroute = AssetRoute[:id]
  assetroute.assetUsed = params[:assetid]
  assetroute.assetRoute = params[:routeid]
  assetroute.save
end

delete '/deleteassetroute' do
  assetroute = AssetRoute[:id]
  assetroute.destroy
end

post '/request' do
    request = Request.new
    request.sender = @user.id
    request.status = "pending"
    request.assetid = params[:asset]
    request.save
end

put '/editrequest' do
  request = Request[:id]
  request.status = params[:status]
end

delete '/deleterequest' do
  request = Request[:id]
  request.destroy
end


post '/transaction' do
  transaction = Transaction.new
  transaction.status = params[:status]
  transaction.pickup = params[:pickup]
  transaction.deliver = params[:deliver]
  transaction.senderid = params[:senderid]
  transaction.transporterid = params[:transporterid]
  transaction.assetused = params[:assetused]
  transaction.deliverable = params[:deliverable]
  transaction.save
end

put '/edittransaction' do
  transaction = Transaction[:id]
  transaction.status = params[:status]
  transaction.pickup = params[:pickup]
  transaction.deliver = params[:deliver]
  transaction.assetused = params[:assetused]
  transaction.deliverable = params[:deliverable]
  transaction.save
end

delete '/deletetransaction' do
  transaction = Transaction[:id]
  transaction.destroy
end
