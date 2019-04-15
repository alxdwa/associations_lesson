Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/authors", to: "authors#index", as: "authors"
  post "/authors", to: "authors#create"
  get "/authors/new", to: "authors#new", as: "new_author"
  get "/authors/:id", to: "authors#show", as: "author"

  get "/books", to: "books#index", as: "books"
  post "/books", to: "books#create"
  get "/books/new", to: "books#new", as: "new_book"
  get "/books/:id", to: "books#show", as: "book"
end
