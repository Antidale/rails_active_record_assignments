# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Reviewer.destroy_all
Book.destroy_all

books = Book.create! [
  { name: "Iain M. Banks", author: "Matter" },
  { name: "Ha'penny", author: "Jo Walton"},
  { name: "Every Heart a Doorway", author: "Seanan McGuire"},
  { name: "Memory", author: "Lois McMaster Bujold"},
  { name: "Pattern Recognition", author: "William Gibson"},
  { name: "A Song for Arbonne", author: "Guy Gavriel Kay"}
]

books.each do | book |

  book.notes.create! [
    {
      title: "A great #{Faker::Book.genre.downcase}!",
      note: Faker::Lorem.paragraph(2, true, 5)
    },
    {
      title: "An okay #{Faker::Book.genre.downcase}!",
      note: Faker::Lorem.sentence(2, true, 3)
    },
    {
      title: "A terrible #{Faker::Book.genre.downcase}!",
      note: Faker::Lorem.paragraph(1, true, 6)
    },
  ]
end

reviewers = Reviewer.create! [
  { name: Faker::Name.name, password: Faker::Internet.password(10, 70) },
  { name: Faker::Name.name, password: Faker::Internet.password(10, 70) }
]

books.each do | book |
  book.reviewer = reviewers.sample
  book.save!
end
