Rails.application.routes.draw do
  resources :book_stores
  resources :wishlists
  get '/books/search' => 'books#search'
  get '/books/author_search' => 'books#author_search'
  get '/books/year_search' => 'books#year_search'
  resources :read_books
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/readbooks' => 'readbooks#index'
  get '/wishlists' => 'wishlists#index'
end
