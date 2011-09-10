module Locations::ForecastsHelper
  def sunset_in_words(time)
    format = "%l:%M"
    if(time.hour == 0)
      format = "%k:%M"
    end
    time.strftime(format)
  end
end
