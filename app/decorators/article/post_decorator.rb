# coding: utf-8
module Article::PostDecorator
  def byline
    content_tag(:p, class: 'byline') do
      show? ? full_byline : responsive_byline
    end
  end

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

  def full_byline
    raw("Posted by #{author.name} in #{link_to column.name, column} on #{time_tag published_at, published_at.strftime(long_strftime), pubdate: true, "data-format": "LLLL"}")
  end

  def responsive_byline
    capture do
      concat content_tag(:span, full_byline, class: 'show-for-medium')
      concat(content_tag(:span, class: 'hide-for-medium', 'aria-label' => strip_tags(full_byline)) do
        raw("#{link_to column.name, column} — #{time_tag published_at, published_at.strftime(short_strftime), pubdate: true, "data-format": "llll"}")
      end)
    end
  end
end
