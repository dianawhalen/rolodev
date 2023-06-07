# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



submissions_data = [
  { title: "Venturefy.ai", url: "https://www.venturefy.com/", notes: "Explore verified corporate relationships for any company. ✅" },
  { title: "Movie Deep Search by AI Keytalk", url: "https://www.mycelebs.com/deepsearch", notes: "Recommendation AI that knows every movie ever created." },
  { title: "Zipy", url: "https://www.zipy.ai/", notes: "Debug instantly with Session Playback and Monitoring in one." },
  { title: "RADAAR", url: "https://www.radaar.io/", notes: "Not just another scheduling tool!" },
  { title: "iStory", url: "https://studio.istorylive.com/", notes: "The power of voice activated content is just an iStory away." },
  { title: "Spinach.io", url: "https://spinach.io/", notes: "Crush your daily standup." },
  { title: "Zeda.io", url: "https://zeda.io/", notes: "AI-powered Product Discovery For Customer-focused Teams." },
  { title: "Searchie", url: "https://searchie.io/", notes: "Create, Manage, & Sell Your Content All In One Place." },
  { title: "Seodity", url: "https://seodity.com/", notes: "All-in-one SEO tool with AI." },
  { title: "MakerBox", url: "https://www.makerbox.club/", notes: "Marketing resources for Solopreneurs." },
  { title: "HireQuotient", url: "https://hirequotient.com/", notes: "A Great Hiring Story Begins with HireQuotient." },
  { title: "Phyllo", url: "https://www.getphyllo.com/", notes: "The Universal API for Creator Data" },
  { title: "Cascadeur", url: "https://cascadeur.com/", notes: "AI-assisted keyframe animation software." },
  { title: "SoWork", url: "https://www.sowork.com/", notes: "Drive faster, better, more connected remote work." },
  { title: "SingleStore Kai for MongoDB", url: "https://www.singlestore.com/", notes: "100x-1000x faster analytics for MongoDB applications." },
  { title: "Taskade", url: "https://www.taskade.com/", notes: "Build a second brain for your team. Chat, organize, and get work done in one unified workspace." },
  { title: "Codesphere", url: "https://codesphere.com/", notes: "Deploy in less than 5s." },
  { title: "vidBoard", url: "https://www.vidboard.ai/", notes: "Make video presentations with AI. 🚀" },
  { title: "Jam", url: "https://jam.dev/", notes: "1 click to capture a perfect bug report. 🚀" },
  { title: "Kairn", url: "https://kairn.app/", notes: "Rock your days." },
]

collection_names = ["Dev Tools", "Cool Sites", "Useful Resources", "Productivty", "Utilities", "Learning", "Networking", "Backend Tools", "Marketing", "SEO Templates"]


5.times do
  user = User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'temppassword',
    from_omniauth: false
  )

  user.update!(password: "#{user.username}#{'%03d' % user.id}")

  2.times do
    user.collections.create!(
      name: collection_names.shift
    )
  end

  4.times do
    user.submissions.create!(submissions_data.shift)
  end
end

all_collections = Collection.all
all_submissions = Submission.all

all_collections.each do |collection|
  collection.collection_submissions.create!(submission_id: all_submissions.sample.id)
end

all_submissions.each do |submission|
  collection = all_collections.sample
  unless collection.submissions.include?(submission)
    collection.collection_submissions.create!(submission_id: submission.id)
  end
end
