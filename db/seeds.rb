# Creating a event
e = Event.create(title: 'Campus Party', description: 'Awesome', user: User.last, begin_date: DateTime.now, end_date: DateTime.now + 1.day)
# Creating a talk
t = Talk.create(title: 'Aprenda a criar uma API com Rails hoje', description: 'Awesome \o/', user: User.last, begin_date: DateTime.now, end_date: DateTime.now + 1.day, event: Event.last)
# Comment in event
e.comments << Comment.create(body: 'Awesome party', user: User.first)
# Comment in talk
t.comments << Comment.create(body: 'Awesome slides \o/', user: User.first)
# Subscribe user in event
e.users << User.first
# Subscribe user in talk
t.users << User.first