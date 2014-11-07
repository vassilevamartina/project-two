require 'httparty'
require 'json'

class RecipesController < ApplicationController

	def index 
		if params[:query] 
    	query = URI.escape(params[:query])

my_api_key = ENV["YM_API_KEY"]
my_api_secret = ENV["YM_API_SECRET"]
		# raise params[:recipe].to_s
		recipe_search_uri = "http://api.yummly.com/v1/api/recipes?_app_id="+my_api_key+"&_app_key="+my_api_secret+"&q="+ query + "&requirePictures=true"
		response = HTTParty.get(recipe_search_uri).to_json	
		recipe_search = JSON.parse(response)
		recipeid = []
		# we're going to loop through my search results for recipes. each RS is one search result
		recipe_search['matches'].each do |rs|
			recipeid.push(rs['id'])
		end
    # go through each recipeid and make and api call for each item in that recipe id to search for picture and link.
    @recipe_get = []
    recipeid.each do |r|
		  recipe_get_uri = "http://api.yummly.com/v1/api/recipe/"+ r +"?_app_id="+my_api_key+"&_app_key="+my_api_secret
      get_response = HTTParty.get(recipe_get_uri).to_json  
      @recipe_get.push(JSON.parse(get_response))
    end
		end
		
    end


		#@next = @matches["imageUrlsBySize"]


		#raise @match.inspect


	end

	def show
		
	end


