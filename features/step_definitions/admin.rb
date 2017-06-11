Given(/^an author$/) do
  @admin_user = FactoryGirl.create :admin_user, :author
end

Given(/^a column$/) do
  FactoryGirl.create :article_column
end

When(/^I sign in to admin$/) do
  visit admin_root_path

  fill_in 'Email', with: @admin_user.email
  fill_in 'Password', with: @admin_user.password

  click_button 'Login'
end

Then(/^I should have (\d+) columns? available/) do |n|
  assert_selector(:css, '#article_post_column_id option', count: n.to_i + 1)
end

When(/^I fill in the article post form$/) do
  post = FactoryGirl.build :article_post, column: @admin_user.article_columns.first

  fill_in 'Headline', with: post.headline
  fill_in 'Subhead', with: post.subhead

  select @admin_user.article_columns.first.name, from: 'Column'

  check 'Publish now'

  # fill_in id: 'article_post_body', with: post.body
  find('.st-text-block p').set("This is some text.")
  save_and_open_screenshot
end
