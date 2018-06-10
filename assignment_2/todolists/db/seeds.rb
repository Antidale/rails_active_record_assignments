# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

people = [
  {:first_name => "Carly", :last_name => "Fiorina", :birth_year => 1954, :gender => "female"},
  {:first_name => "Donald", :last_name => "Trump", :birth_year => 1946, :gender => "male"},
  {:first_name => "Ben", :last_name => "Carson", :birth_year => 1951, :gender => "male"},
  {:first_name => "Hillary", :last_name => "Clinton", :birth_year => 1947, :gender => "female"}
]

due_date = Date.today + 1.year

people.each do | person |

  user = User.create!(username: person[:last_name], password_digest: person[:first_name])

  user.create_profile(
    gender: person[:gender],
    birth_year: person[:birth_year],
    first_name: person[:first_name],
    last_name: person[:last_name]
  )

  todo_list = user.todo_lists.create!(
    list_due_date: due_date,
    list_name: "My Special List"
  )

  (1..5).each do | i |
    todo_list.todo_items.create!(
      due_date: due_date,
      title: "My List #{i}",
      description: "A list of stuff to do",
      completed: false
    )
  end
end
