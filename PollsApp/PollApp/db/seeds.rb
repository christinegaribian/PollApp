# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


rob = User.create!(user_name: "robin")
christine = User.create!(user_name: "christine")
ranelle = User.create!(user_name: "ranelle")

p1 = Poll.create!(title: 'Well Being', user_id: rob.id)
p2 = Poll.create!(title: 'The Meaning of Life', user_id: christine.id)
p3 = Poll.create!(title: 'a/A TAs', user_id: ranelle.id)

q1 = Question.create!(poll_id: p1.id, body: "How are you doing?")
q2 = Question.create!(poll_id: p1.id, body: "Did you shower today?")
q3 = Question.create!(poll_id: p2.id, body: "Why are you here??")
q4 = Question.create!(poll_id: p3.id, body: "Who is the best TA?")

ac1 = AnswerChoice.create!(text: "good", question_id: q1.id)
ac2 = AnswerChoice.create!(text: "great", question_id: q1.id)
ac3 = AnswerChoice.create!(text: "yes", question_id: q2.id)
ac4 = AnswerChoice.create!(text: "no", question_id: q2.id)
ac5 = AnswerChoice.create!(text: "I am not", question_id: q3.id)
ac6 = AnswerChoice.create!(text: "I plead the fifth", question_id: q4.id)


r1 = Response.create!(user_id: rob.id, answer_choice_id: ac2.id)
r2 = Response.create!(user_id: christine.id, answer_choice_id: ac1.id)
r3 = Response.create!(user_id: christine.id, answer_choice_id: ac5.id)
r4 = Response.create!(user_id: ranelle.id, answer_choice_id: ac6.id)
