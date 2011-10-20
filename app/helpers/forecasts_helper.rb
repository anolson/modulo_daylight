module ForecastsHelper
  def format_time(time)
    time.strftime((time.hour == 0) && "%k:%M" || "%l:%M").lstrip
  end

  def format_datetime(time)
    time.strftime('%Y-%m-%dT%I:%M:%SZ')
  end
end
