module Locations::ForecastsHelper
  def format_time(time)
    time.strftime("%l:%M")
  end
end
