class Time
  def round(seconds = 60)
    Time.at((self.to_f / seconds).round * seconds).utc
  end

  def floor(seconds = 60)
    Time.at((self.to_f / seconds).floor * seconds).utc
  end
end