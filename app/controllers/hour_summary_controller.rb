class HourSummaryController < ApplicationController
  unloadable

  def index
    @hours_this_week = TimeEntry.sum(:hours, :conditions => ['user_id = ? AND YEARWEEK(spent_on, 1) = YEARWEEK(NOW(), 1)', 1])
    @hours_to_go = 30.0 - @hours_this_week
    @average_per_day = @hours_this_week / Date.today.wday
    
    render :layout => false
  end
  
  def check_if_login_required
    return true
  end
  
end
