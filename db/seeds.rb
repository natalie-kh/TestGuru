# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ email: 'ELIZABETH_II@gmail.com', password: 'passII' },
                      { email: 'GEORGE_VI@gmail.com', password: 'passVI' },
                      { email: 'EDWARD_VIII@gmail.com', password: 'passVIII' }])

categories = Category.create!([{ title: 'public' },
                               { title: 'work' }])

tests = Test.create!([{ title: 'How Smart You Are', level: 3, category: categories[0], author: users[2] },
                      { title: 'Know horror sequels?', level: 1, category: categories[0], author: users[0] }])

questions = Question.create!([{ body: 'Which was Boris Karloff\'s second film as Frankenstein\'s monster?', test: tests[1] },
                              { body: 'What was the subtitle of A Nightmare on Elm Street 2?', test: tests[1] }])

answers = Answer.create!([{ body: 'Bride of Frankenstein', correct: true, question: questions[0] },
                          { body: 'Frankenstein Meets the Wolf Man', correct: false, question: questions[0] },
                          { body: 'The Ghost of Frankenstein', correct: false, question: questions[0] },
                          { body: 'The Dream Child', correct: false, question: questions[1] },
                          { body: 'The Dream Master', correct: false, question: questions[1] },
                          { body: 'Freddy\'s Revenge', correct: true, question: questions[1] }])

# test_passages = TestPassage.create!([{ user: users[0], test: tests[0] },
#                                  { user: users[0], test: tests[1] },
#                                  { user: users[1], test: tests[1] },
#                                  { user: users[2], test: tests[1] }])
