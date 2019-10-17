# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ email: 'ELIZABETH_II@gmail.com', password: 'passII' },
                      { email: 'GEORGE_VI@gmail.com', password: 'passVI' },
                      { email: 'EDWARD_VIII@gmail.com', password: 'passVIII' },
                      { email: 'natalee.bogdanova@gmail.com', password: 'admin1', first_name: 'Natalya', last_name: 'B', type: 'Admin' }])

categories = Category.create!([{ title: 'public' },
                               { title: 'work' },
                               { title: 'backend' },
                               { title: 'frontend' }])

tests = Test.create!([{ title: 'How Smart You Are', level: 3, category: categories[0], author: users[2] },
                      { title: 'Know horror sequels?', level: 1, category: categories[0], author: users[0] },
                      { title: 'Ruby', level: 3, category: categories[2], author: users[3] },
                      { title: 'HTML', level: 2, category: categories[3], author: users[3] },
                      { title: 'CSS', level: 1, category: categories[3], author: users[3] }])

questions = Question.create!([{ body: 'Which was Boris Karloff\'s second film as Frankenstein\'s monster?', test: tests[1] },
                              { body: 'What was the subtitle of A Nightmare on Elm Street 2?', test: tests[1] },
                              { body: 'Ruby Question1', test: tests[2] },
                              { body: 'Ruby Question2', test: tests[2] },
                              { body: 'HTML Question1', test: tests[3] },
                              { body: 'HTML Question2', test: tests[3] },
                              { body: 'CSS Question1', test: tests[4] },
                              { body: 'CSS Question2', test: tests[4] },
                              { body: 'What is the Capital of GB?', test: tests[0] }])

answers = Answer.create!([{ body: 'Bride of Frankenstein', correct: true, question: questions[0] },
                          { body: 'Frankenstein Meets the Wolf Man', correct: false, question: questions[0] },
                          { body: 'The Ghost of Frankenstein', correct: false, question: questions[0] },
                          { body: 'Answer incorrect', correct: false, question: questions[1] },
                          { body: 'The Dream Child', correct: false, question: questions[1] },
                          { body: 'The Dream Master', correct: false, question: questions[1] },
                          { body: 'Freddy\'s Revenge', correct: true, question: questions[1] },
                          { body: 'Answer Correct', correct: true, question: questions[2] },
                          { body: 'Answer incorrect', correct: false, question: questions[3] },
                          { body: 'Answer Correct', correct: true, question: questions[4] },
                          { body: 'Answer incorrect', correct: false, question: questions[5] },
                          { body: 'Answer Correct', correct: true, question: questions[6] },
                          { body: 'Answer incorrect', correct: false, question: questions[7] },
                          { body: 'London!!!', correct: true, question: questions[8] }])

badges = Badge.create!([{ name: 'Level 1 Completed', description: 'Complete all tests from Level 1', rule: 'by_level', rule_value: '1', image: 'by_level.png' },
                        { name: 'Category Frontend Completed', description: 'Complete all tests from Category Frontend', rule: 'by_category', rule_value: 'frontend', image: 'by_category.png' },
                        { name: 'Excellent knowledge of Ruby', description: 'Complete Ruby Test in 1 try', rule: 'by_attempt', rule_value: 'Ruby', image: 'by_attempt.png' }])
