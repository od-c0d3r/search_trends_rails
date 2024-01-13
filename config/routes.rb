Rails.application.routes.draw do
  root to: 'articles#search'

  get 'articles/search', defaults: { format: 'turbo_stream' }
  get 'analytics/index'
end
