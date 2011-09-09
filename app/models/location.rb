class Location < ActiveRecord::Base
  after_create :cache_location
  has_many :forecasts
  has_many :queries
    
  def cache_location()
    unless cached?
      weather = Weather.query(query_string)
      update_attributes(weather.location.merge(:cached => true))
      Forecast.create(:cached => true, :date => today, :location => self, :sunset_in_seconds => weather.sunset_in_seconds) 
    end
  end
   
  def self.find_or_create_by_state_and_city(options = {}, &block)
    options.each { |k, v| v.gsub("_", " ").downcase! if(k == :city || k == :state) }
    Location.find_by_state_and_city(options[:state], options[:city]) || Location.create(options, &block)
  end
    
  def forecast_for_today
    forecasts.where(:date => today).first || Forecast.create(:date => today, :location => self)
  end
  
  def name
    "#{city.titleize}, #{state.upcase}"
  end
  
  def query_string
    "#{city}, #{state}"
  end
  
  def today
    @today ||= Time.now.in_time_zone(timezone).to_date
  end
end
