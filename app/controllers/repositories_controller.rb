class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # https://lostisland.github.io/faraday/usage/
    # Make a simple GET request by requiring the Faraday gem and using Faraday.get:
    # response = Faraday.get 'http://sushi.com/nigiri/sake.json'
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      # binding.pry
      # params = {"query"=>"tetris", "controller"=>"repositories", "action"=>"github_search"}
      req.params["q"] = params[:query]
      req.params["client_id"] = '' # get it from github
      req.params["client_secret"] = ''
    end
    # binding.pry
    body = JSON.parse(resp.body)
    @items = body["items"]
    render :search
  end
end
