class Query < ActiveRecord::Base
  belongs_to :location
  
  def self.query_location(term)
    query = find_or_create_by_term(term)
    
    return query.location if query.location
    
    weather = Weather.query(term)
    Location.find_or_create_by_state_and_city(weather.location.merge(:cached => true)) do |location|
      location.queries << query
    end
  end
end