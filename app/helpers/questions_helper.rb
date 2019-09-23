module QuestionsHelper
  def header_creator(page)
    header = page == 'edit' ? 'Edit' : 'Create New'
    "#{header} '#{@test.title}' Test Question"
  end

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "http://#{author}/#{repo}"
  end

end
