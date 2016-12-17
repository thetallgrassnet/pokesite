module Article::PostDecorator
  def content
    action_name == 'show' ? body : excerpt
  end
end
