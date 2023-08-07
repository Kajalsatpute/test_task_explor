# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

library = Library.create(name: 'Central Library')
books = library.books.create([{title: 'Maths References'},{title: 'Science References'}])

user = User.create(name: 'Tina')
books = library.books.create([{title: 'English References', user_id: user.id},{title: 'Hindi References'}])
