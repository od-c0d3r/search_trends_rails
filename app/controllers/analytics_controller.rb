class AnalyticsController < ApplicationController
  def index
    @last_searched = SearchLog.order(created_at: :desc).limit(10)
    @most_searched = SearchLog.group(:term).select('term, COUNT(*) as hit_count').order('hit_count DESC').limit(10)

    @last_hour_trending_term = SearchLog.where('created_at >= ?', 1.hour.ago)
                                        .group(:term)
                                        .select('term, COUNT(*) as hit_count')
                                        .order('hit_count DESC')
                                        .limit(1).last

    @last_24_hours_trending_term = SearchLog.where('created_at >= ?', 1.day.ago)
                                            .group(:term)
                                            .select('term, COUNT(*) as hit_count')
                                            .order('hit_count DESC')
                                            .limit(1).last

    @last_week_trending_term = SearchLog.where('created_at >= ?', 1.week.ago)
                                        .group(:term)
                                        .select('term, COUNT(*) as hit_count')
                                        .order('hit_count DESC')
                                        .limit(1).last

    @last_month_trending_term = SearchLog.where('created_at >= ?', 1.month.ago)
                                         .group(:term)
                                         .select('term, COUNT(*) as hit_count')
                                         .order('hit_count DESC')
                                         .limit(1).last
  end
end
