class SearchTerm < ApplicationRecord
    # app/models/search_term.rb
    validates :term, presence: true, uniqueness: { case_sensitive: false }
  
end
