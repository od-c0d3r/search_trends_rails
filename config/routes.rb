Rails.application.routes.draw do
  root to: 'articles#search'
  get 'articles/search'
end
