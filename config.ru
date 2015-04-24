# encoding: UTF-8
require 'sass/plugin/rack'
require './fracht'

use Sass::Plugin::Rack
run Sinatra::Application
