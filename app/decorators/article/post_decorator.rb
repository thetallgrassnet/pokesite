# coding: utf-8
module Article::PostDecorator
  def byline
    content_tag(:p, class: 'byline') do
      index? ? responsive_byline : full_byline
    end
  end

  def content
    index? ? excerpt : body
  end

  def display_featured_image
    index? ? featured_image.thumb : featured_image
  end

  private

  def index?
    action_name == 'index' or controller_name == 'columns'
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
