# app/controllers/search_controller.rb
class SearchController < ApplicationController
  def index
    ip_address = request.remote_ip
    @search_terms = SearchTerm.where(ip_address: ip_address).limit(20)
  end

  def create
    term = params[:term]
    ip_address = request.remote_ip

    if term.present?
      all_terms = SearchTerm.where(ip_address: ip_address)

      # Find the most specific term in the database
      existing_term = all_terms.max_by { |t| term.downcase.include?(t.term.downcase) ? t.term.length : 0 }

      if existing_term && term.downcase.include?(existing_term.term.downcase)
        # If a similar term exists, update it only if the new term is more specific
        existing_term.update(term: term) if term.split.length > existing_term.term.split.length
      else
        # If not, create a new record
        SearchTerm.create(term: term, ip_address: ip_address)
      end
    end

    head :ok
  end
end
