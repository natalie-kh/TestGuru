module QuestionsHelper
  def header_creator
    header = @question.persisted? ? 'Edit' : 'Create New'
    "#{header} '#{@question.test.title}' Test Question"
  end
end
