Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :libraries, only: [] do
        resources :books, only: [:index]
        get '/check_book_availability', to: "books#check_book_availability"
      # end
    end
  end
end
