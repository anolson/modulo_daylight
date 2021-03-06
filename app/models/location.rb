class Location < ActiveRecord::Base
  after_create :cache_location
  has_many :forecasts
  has_many :queries
    
  def cache_location()
    unless cached?
      weather = Weather.query(query_string)
      update_attributes(weather.location.merge(:cached => true))
      Forecast.create(:cached => true, :location => self, :sunset_in_seconds => weather.sunset_in_seconds)
    end
  end
   
  def self.find_or_create_by_state_and_city(options = {}, &block)
    remove_underscores!(options)
    Location.find_by_state_and_city(options[:state], options[:city]) || Location.create(options, &block)
  end

  def forecast_for_today
    forecasts.select { |f| f.today? }.first || Forecast.create(:location => self)
  end
  
  def name
    "#{city.titleize}, #{state.upcase}"
  end
  
  def query_string
    "#{city}, #{state}"
  end

  def underscore_city_and_state
    { :city => city.gsub(" ", "_"), :state => state.gsub(" ", "_") }
  end

  def as_json(options = {})
    {
      :name => name,
      :timezone => timezone
    }
  end

  private
    def self.remove_underscores!(options)
      options.each { |k, v| v.gsub("_", " ").downcase! if( [:city, :state].include? k ) }
    end
end
