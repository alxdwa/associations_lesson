Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/authors", to: "authors#index", as: "authors"
  post "/authors", to: "authors#create"
  get "/authors/new", to: "authors#new", as: "new_author"
  get "/authors/:id", to: "authors#show", as: "author"

  patch "/authors/:id", to: "authors#update"
  put "/authors/:id", to: "authors#update"
  delete "/authors/:id", to: "authors#destroy"
  get "/authors/:id/edit", to: "authors#edit", as: "edit_author"

  get "/books", to: "books#index", as: "books"
  post "/books", to: "books#create"
  get "/books/new", to: "books#new", as: "new_book"
  get "/books/:id", to: "books#show", as: "book"

  patch "/books/:id", to: "books#update"
  put "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"
  get "/books/:id/edit", to: "books#edit", as: "edit_book"
end
