Person.destroy_all
Hobby.destroy_all

(1..10).each do
  person = Person.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    login: Faker::Internet.user_name(4..10),
    pass: Faker::Internet.password(5,15)
  )

  hobbies = Hobby.create! [
    {name: "hiking"}, {name: "running"}, {name: "board games"}, {name: "reading"}, {name: "baking"}, {name: "knitting"}, {name: "basketball"}, {name: "coding"}, {name: "writing"}, {name: "cooking"}]

  person.create_personal_info(
    height: Faker::Number.between(60,80),
    weight: Faker::Number.between(120,250)
  )

  jobs = person.jobs.create! [
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

  jobs.each do | job |
    min_salary = Faker::Number.number(5).to_f
    max_salary = min_salary + Faker::Number.number(4).to_f
    puts max_salary
    job.create_salary_range(
      min_salary: min_salary,
      max_salary: max_salary
    )
    end

  person.hobbies << hobbies.sample(3)
end
