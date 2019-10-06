module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def alert_class(key)
    { success: 'alert-success', alert: 'alert-danger', notice: 'alert-info' }[key.to_sym]
  end
end
