require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Flatiron
  class App < Sinatra::Application
    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #database
    set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
    #filters

    #routes
    # get '/compliment/:banana' do
    #   "<h1>#{COMPLIMENTS[params["banana"].to_i-1]}</h1>"
    # end

    get "/compliment" do
      "<h1>#{Compliment.find(rand(Compliment.count) + 1).title}</h1>"
    end

    get "/compliments" do
      @compliments = Compliment.all
      erb :index
    end

    get "/compliment/:id" do
      "<h1>#{Compliment.find_by_id(params["id"].to_i).title}</h1><br><a href='/compliments'>HOME</a>"
    end

    get "/insult" do

    end

    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
