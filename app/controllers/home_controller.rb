class HomeController < ApplicationController
  def index
    if request.GET.include? 'pokesearch'
      url = "http://pokeapi.co/api/v2/pokemon/" + params[:pokesearch]
      @data = ActiveSupport::JSON.decode( HTTParty.get(url, headers: {'content_type' => 'application/json'} ).to_json )

      url = "http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=" + @data['name']
      @giphy = ActiveSupport::JSON.decode( HTTParty.get(url, headers: {'content_type' => 'application/json'} ).to_json )
    else
      
    end
  end
end