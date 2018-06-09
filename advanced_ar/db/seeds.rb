Person.destroy_all

(1..10).each do
  person = Person.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    login: Faker::Internet.user_name(4..10),
    pass: Faker::Internet.password(5,15)
  )


  person.create_personal_info(
    height: Faker::Number.between(60,80),
    weight: Faker::Number.between(120,250)
  )

  person.jobs.create! [
    {
      title: Faker::Job.title,
      company: Faker::Company.name,
      position_id: Faker::Number.between(1,100)
    },{
      title: Faker::Job.title,
      company: Faker::Company.name,
      position_id: Faker::Number.between(1,100)
    },{
      title: Faker::Job.title,
      company: Faker::Company.name,
      position_id: Faker::Number.between(1,100)
    }
  ]

end
