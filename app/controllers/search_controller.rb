# app/controllers/search_controller.rb
class SearchController < ApplicationController
  def search
    results = Ticket.search(params[:q])
    render json: results.records
  end

end
