class DashboardController < ApplicationController
  def index
    labels = []
    last_week_nights = []
    last_week_days = []
    day_quality = []
    night_quality = []
    average_quality = []
    sleep_time = []
    nights = current_user.nights
    days = current_user.days

    (6.days.ago.to_date..Date.today).map do |n_day|
      today = (n_day.beginning_of_day..n_day.end_of_day)

      night = (nights.find_by(created_at: today) || empty_day)
      day = (days.find_by(created_at: today) || empty_day)

      sleep_time << ((night[:wake_hour] - night[:sleep_hour]).to_i/3600).round(2)

      last_week_nights << night
      last_week_days << day
      day_quality << day[:quality]
      night_quality << night[:quality]
      average_quality << ((night[:quality] + day[:quality]) / 2.0)
      labels << n_day.strftime('%a')
    end

    @json = {
      labels: labels,
      nights: last_week_nights.pluck(:quality),
      days: last_week_days.pluck(:quality),
      sleep_time: sleep_time,
      day_quality: day_quality,
      night_quality: night_quality,
      average_quality: average_quality
    }
  end

  def empty_day
    {
      quality: 0,
      sleep_hour: 0,
      wake_hour: 0,
    }
  end

  def settings; end

  def calendar; end
end