# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# submissions_data = [
#   { title: "First Post", url: "http://example.com/1", notes: "This is the first post." },
#   { title: "Second Post", url: "http://example.com/2", notes: "This is the second post." },
#   { title: "Third Post", url: "http://example.com/3", notes: "This is the third post." },
#   { title: "Fourth Post", url: "http://example.com/4", notes: "This is the fourth post." },
#   { title: "Fifth Post", url: "http://example.com/5", notes: "This is the fifth post." },
#   { title: "Sixth Post", url: "http://example.com/6", notes: "This is the sixth post." },
#   { title: "Seventh Post", url: "http://example.com/7", notes: "This is the seventh post." },
#   { title: "Eighth Post", url: "http://example.com/8", notes: "This is the eighth post." },
#   { title: "Ninth Post", url: "http://example.com/9", notes: "This is the ninth post." },
#   { title: "Tenth Post", url: "http://example.com/10", notes: "This is the tenth post." },
#   { title: "Eleventh Post", url: "http://example.com/11", notes: "This is the eleventh post." },
#   { title: "Twelfth Post", url: "http://example.com/12", notes: "This is the twelfth post." },
#   { title: "Thirteenth Post", url: "http://example.com/13", notes: "This is the thirteenth post." },
#   { title: "Fourteenth Post", url: "http://example.com/14", notes: "This is the fourteenth post." },
#   { title: "Fifteenth Post", url: "http://example.com/15", notes: "This is the fifteenth post." },
#   { title: "Sixteenth Post", url: "http://example.com/16", notes: "This is the sixteenth post." },
#   { title: "Seventeenth Post", url: "http://example.com/17", notes: "This is the seventeenth post." },
#   { title: "Eighteenth Post", url: "http://example.com/18", notes: "This is the eighteenth post." },
#   { title: "Nineteenth Post", url: "http://example.com/19", notes: "This is the nineteenth post." },
#   { title: "Twentieth Post", url: "http://example.com/20", notes: "This is the twentieth post." },
# ]
#
# collection_names = ["First Collection", "Second Collection", "Third Collection", "Fourth Collection", "Fifth Collection", "Sixth Collection", "Seventh Collection", "Eighth Collection", "Ninth Collection", "Tenth Collection"]
#
#
# 5.times do
#   user = User.create!(
#     username: Faker::Internet.username,
#     email: Faker::Internet.email,
#     password: 'temppassword',
#     from_omniauth: false
#   )
#
#   user.update!(password: "#{user.username}#{'%03d' % user.id}")
#
#   2.times do
#     user.collections.create!(
#       name: collection_names.shift
#     )
#   end
#
#   4.times do
#     user.submissions.create!(submissions_data.shift)
#   end
# end
#
# all_collections = Collection.all
# all_submissions = Submission.all
#
# all_collections.each do |collection|
#   collection.collection_submissions.create!(submission_id: all_submissions.sample.id)
# end
#
# all_submissions.each do |submission|
#   collection = all_collections.sample
#   unless collection.submissions.include?(submission)
#     collection.collection_submissions.create!(submission_id: submission.id)
#   end
# end
