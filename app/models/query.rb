class Query < ActiveRecord::Base
  belongs_to :location
  
  validates_presence_of :term
  
  def self.query_location(term)
    query = find_or_create_by_term(term)

    query.location if query.location
    raise ActiveRecord::RecordInvalid.new(query) unless query.valid?
    
    weather = Weather.query(term)
    Location.find_or_create_by_state_and_city(weather.location.merge(:cached => true)) do |location|
      location.queries << query
    end    
  end
end