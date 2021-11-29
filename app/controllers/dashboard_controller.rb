class DashboardController < ApplicationController
  def index
    json = GetUserWeeklySummaryService.perform(current_user)

    @json = json
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