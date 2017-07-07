require 'net/http'
require 'json'

def format_api_url(search_term)
    api_key = 'dad14f2a0e084731af7dbd9dd5381f34'
    endpoint = "http://api.giphy.com/v1/gifs/search?q=#{search_term}&api_key=#{api_key}"
    
end

def call_giphy_api(url)
    # include all the gems needed to use apis in ruby
        #first two lines
    # open an access point to grab data
    uri = URI(url)  #establishes an address to go grab the data with ruby
    data = Net::HTTP.get(uri)    #goes to actually get/grab the data
    # convert the data to a ruby hash
    formatted_data = JSON.parse(data)
    
    # puts formatted_data
    # find the right url
    
=begin
    #alternate step by step approach
    result_array = formatted_data["data"]
    random_result = result_array.sample
    url = random_result["images"]["fixed_height"]["url"]
=end
    
    # below was working for a random gif
    # result = formatted_data["data"].sample["images"]["fixed_height"]["url"]
    
    result_array = formatted_data["data"]
    gif_url_array = result_array.map do |item|
        item["images"]["fixed_height"]["url"]
    end
    
    
    # returns the giphy url
    # return result 
    
    # now returns the gif_url_array
    return gif_url_array
end