module ForecastsHelper
  def format_time(time)
    time.strftime((time.hour == 0) && "%k:%M" || "%l:%M").lstrip
  end

  def format_datetime(time)
    time.iso8601
  end
end
