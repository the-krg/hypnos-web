class DashboardController < ApplicationController
  def index
    labels = []
    last_week_nights = []
    last_week_days = []
    average = []

    (6.days.ago.to_date..Date.today).map do |day|
      today = (day.beginning_of_day..day.end_of_day)

      night_quality = (current_user.nights.find_by(created_at: today) || { quality: 0 })
      day_quality = (current_user.days.find_by(created_at: today) || { quality: 0 })

      last_week_nights << night_quality
      last_week_days << day_quality
      average << ((night_quality[:quality] + day_quality[:quality]) / 2.0)
      labels << day.strftime('%a')
    end

    @json = {
      labels: labels,
      nights: last_week_nights.pluck(:quality),
      days: last_week_days.pluck(:quality),
      average: average
    }
  end

  def settings; end

  def calendar; end
end