class Location < ActiveRecord::Base
  has_many :forecasts
  has_many :queries
  
  def name
    "#{city}, #{state}"
  end
end
