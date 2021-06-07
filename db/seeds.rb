User.create([
  {username: 'Banana', email:'banana@email.com', password: 'ban12345'},
  {username: 'Wonton', email:'wonton@email.com', password: 'won12345'},
  {username: 'Deedee', email:'deedee@email.com', password: 'dee12345'}
  ])

# Collection.create([
#   {name: 'Tools'},
#   {name: 'Practice'},
#   {name: 'Networking'},
#   {name: 'Productivity'},
#   {name: 'Social'}
#   ])

Submission.create([
  {user_id: 1, title: 'Cool Site', url: 'coolsite.com', notes: 'Pretty neat, check it out!' },
  {user_id: 1, title: 'Useful Tools', url: 'devtools.com', notes: 'Pretty neat, check it out!' },
  {user_id: 2, title: 'Best Cheatsheets', url: 'cheatsheets.com', notes: 'Pretty neat, check it out!' },
  {user_id: 2, title: 'Code Practice', url: 'codepreactice.com', notes: 'Pretty neat, check it out!' },
  {user_id: 3, title: 'Networking List', url: 'networklist.com', notes: 'Pretty neat, check it out!' },
  {user_id: 3, title: 'Productivity Hacks', url: 'beproductive.com', notes: 'Pretty neat, check it out!' }
  ])

# {collection_id: 4, user_id: 3, title: 'Productivity Hacks', url: 'beproductive.com', notes: 'Pretty neat, check it out!' }
