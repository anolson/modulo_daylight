class Query < ActiveRecord::Base
  after_create :initialize_location
  belongs_to :location
  
  validates_presence_of :term
  
  def self.query_location(term)
    query = find_or_create_by_term(term)
    raise ActiveRecord::RecordInvalid.new(query) unless query.valid?
    query.location
  end
  
  private   
    def initialize_location
      weather = Weather.query(term)
      Location.find_or_create_by_state_and_city(weather.location.merge(:cached => true)) do |location|
        location.queries << self
      end
    end
end