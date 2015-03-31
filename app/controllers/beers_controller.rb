class BeersController < ApplicationController

	def index
    if params[:search]
      search = params[:search].gsub(' ', '+')
      response = HTTParty.get("http://api.brewerydb.com/v2/search?q=#{search}&type=beer&withBreweries=Y&key=c770860e1966fa932eb31ed54c2f534e")
      results = JSON.parse(response.body)
      @results = results['data']
    else
      @results = []
    end
  end

	def show
    @beer_id = params[:id]
    @request_url = "http://api.brewerydb.com/v2/beer/#{@beer_id}?withBreweries=Y&key=c770860e1966fa932eb31ed54c2f534e"
    response = HTTParty.get(@request_url)
    result = JSON.parse(response.body)
    @result = result['data']

    if @result['description']
      @description = @result['description']
    else
      @description = "N/A"
    end

    if @result['style']['name']
      @style_name = @result['style']['name']
    else
      @style_name = 'N/A'
    end
   
    if @result['labels']
      @image_url = @result['labels']['medium']
    else
      @image_url = 'Logo.png'
    end
    # @favorite = Favorite.find_by(beer_id: @result['id'])

    # if !@favorite 
    #   @favorite = Favorite.new(beer_id: @results['id'], name: @results['name'])
    # end
  end

end
