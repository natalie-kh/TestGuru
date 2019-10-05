module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end

  def alert_class(key)
    case key
      when 'success'
        'alert-success'
      when 'alert'
        'alert-danger'
      when 'notice'
        'alert-info'
    end
  end

end

