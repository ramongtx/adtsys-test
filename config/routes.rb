Rails.application.routes.draw do
  resources :makes, only: %i(index show), :path => '/'
end
