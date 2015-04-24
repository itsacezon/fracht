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
