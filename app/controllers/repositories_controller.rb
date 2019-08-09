class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      # binding.pry
      # params = {"query"=>"tetris", "controller"=>"repositories", "action"=>"github_search"}
      req.params["q"] = params[:query]
      req.params["client_id"] = '' # get it from github
      req.params["client_secret"] = ''
    end
    
  end
end
