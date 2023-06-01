# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  user = User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password_digest: Faker::Internet.password(min_length: 8),
    from_omniauth: false
  )

  10.times do
    submission = user.submissions.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      url: Faker::Internet.url,
      notes: Faker::Lorem.paragraph(sentence_count: 2)
    )

    5.times do
      collection = user.collections.create!(
        name: Faker::Lorem.words(number: 3).join(" ")
      )
      collection.collection_submissions.create!(
        submission_id: submission.id
      )
    end
  end
end
