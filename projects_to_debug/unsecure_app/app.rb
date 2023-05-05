require "sinatra/base"
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    return erb(:index)
  end

  post "/hello" do
    if params[:name].include?("<script>")
      status 400
      return erb(:hello)
    end
    @name = params[:name]

    return erb(:hello)
  end
end
