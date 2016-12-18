module Article::PostDecorator
  def content
    show? ? body : excerpt
  end

  def display_featured_image
    show? ? featured_image : featured_image.thumb
  end

  private

  def show?
    action_name == 'show'
  end
end
