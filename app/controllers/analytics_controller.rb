class AnalyticsController < ApplicationController
  def index
    @active_tab = 'analytics'
    @last_searched = SearchLog.order(created_at: :desc).limit(5)
    @most_searched = SearchLog.group(:term).select('term, COUNT(*) as hit_count').order('hit_count DESC').limit(5)

    @last_hour = SearchLog.where('created_at >= ?', 1.hour.ago)
                          .group(:term)
                          .select('term, COUNT(*) as hit_count')
                          .order('hit_count DESC')
                          .limit(1).last

    @last_day = SearchLog.where('created_at >= ?', 1.day.ago)
                         .group(:term)
                         .select('term, COUNT(*) as hit_count')
                         .order('hit_count DESC')
                         .limit(1).last

    @last_week = SearchLog.where('created_at >= ?', 1.week.ago)
                          .group(:term)
                          .select('term, COUNT(*) as hit_count')
                          .order('hit_count DESC')
                          .limit(1).last

    @last_month = SearchLog.where('created_at >= ?', 1.month.ago)
                           .group(:term)
                           .select('term, COUNT(*) as hit_count')
                           .order('hit_count DESC')
                           .limit(1).last
  end
end
