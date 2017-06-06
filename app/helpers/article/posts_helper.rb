module Article::PostsHelper
  def long_strftime
    '%A, %B %-d %Y %I:%M %p'
  end

  def short_strftime
    '%a, %b %-d %Y %I:%M %p'
  end
end
