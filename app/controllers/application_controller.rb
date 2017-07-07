require './config/environment'
require './app/models/giphy_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  post '/results' do
    # grab the users input from the params hash
    search_term = params[:search_term]
   # puts search_term
    # send the users input to our giphy_model.rb file
    url = format_api_url(search_term)
    # take giphy response and send it to the results page
    @gif_url_array = call_giphy_api(url) #make it instance var so class can acces it
    #puts url
    # render the results page
    erb :results
    
  end  
end
