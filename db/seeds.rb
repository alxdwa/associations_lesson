# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
authors = []

for i in 1..30
  author = Author.create(
    name: Faker::Book.author,
    date_of_birth: Faker::Date.birthday(18, 65)
  )
  authors.push(author)
  puts "Created #{i} authors"
end

genres = [
  "Fantasy",
  "Science Fiction",
  "Romance",
  "Western",
  "Classic",
  "Thriller",
  "Horror",
  "Dystopia",
  "Non-Fiction",
  "Crime",
  "Anime"
]

genres.each do |genre|
  Genre.create(name: genre)
  puts "Created the genre: #{genre}"
end

for i in 1..5
  User.create(
    email: "alex+#{i}@test.com",
    password: "testpass"
  )
  puts "Created #{i} users"
end

for i in 1..200
  Book.create(
    title: Faker::Book.title,
    author_id: authors[rand(0..(authors.length - 1))].id,
    description: Faker::Hipster.paragraph(2, false, 4),
    user_id: rand(1..5)
    )
  puts "Created #{i} books"
end

books = Book.all
books.each do |book|
  rand(1..3).times do
    idx = rand(0..(Genre.all.length - 1))
    book.genres << Genre.all[idx] unless book.genres.include?(Genre.all[idx])
  end
end