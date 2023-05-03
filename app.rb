require "sinatra/base"
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/hello" do
    name = params[:name]

    return "Hello #{name}"
  end

  post "/submit" do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: '#{message}'"
  end

  get "/names" do
    return "Julia, Mary, Karim"
  end

  post "/sort-names" do
    names = params[:names]
    sorted_names = names.split(",").sort.join(",")
    return sorted_names
  end

  get "/" do
    @name = 'Cyryl'
    return erb(:index)
  end
end
