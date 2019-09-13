# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'ELIZABETH II', login: 'ELIZABETH II', password: 'passII' },
                      { name: 'GEORGE VI', login: 'GEORGE VI', password: 'passVI' },
                      { name: 'EDWARD VIII', login: 'EDWARD VIII', password: 'passVIII' }])

categories = Category.create!([{ title: 'public' },
                               { title: 'work' }])

tests = Test.create!([{ title: 'How Smart You Are', level: 3, category_id: categories[0].id, author_id: users[2].id },
                      { title: 'Know horror sequels?', level: 1, category_id: categories[0].id, author_id: users[0].id }])

questions = Question.create!([{ body: 'Which was Boris Karloff\'s second film as Frankenstein\'s monster?', test_id: tests[1].id },
                              { body: 'What was the subtitle of A Nightmare on Elm Street 2?', test_id: tests[1].id }])

answers = Answer.create!([{ body: 'Bride of Frankenstein', correct: true, question_id: questions[0].id },
                          { body: 'Frankenstein Meets the Wolf Man', correct: false, question_id: questions[0].id },
                          { body: 'The Ghost of Frankenstein', correct: false, question_id: questions[0].id },
                          { body: 'The Dream Child', correct: false, question_id: questions[1].id },
                          { body: 'The Dream Master', correct: false, question_id: questions[1].id },
                          { body: 'Freddy\'s Revenge', correct: true, question_id: questions[1].id }])

tests_users = TestsUser.create!([{ user_id: users[0].id, test_id: tests[0].id },
                                { user_id: users[0].id, test_id: tests[1].id },
                                { user_id: users[1].id, test_id: tests[1].id },
                                { user_id: users[2].id, test_id: tests[1].id }])
