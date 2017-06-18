require 'securerandom'

exit 1 if Rails.env.production? and not ENVied.HEROKU_PARENT_APP_NAME == 'ttgn-pokesite-staging'

AdminUser.create! name: 'Superuser', email: 'superuser@thetallgrass.net', password: SecureRandom.base64(12), superuser: true

body = {
  "data" => [
              {
                "type" => "text",
                "data" => {
                            "text" => "<p>This is a paragraph of body content."
                          }
              },
              {
                "type" => "text",
                "data" => {
                            "text" => "<p>This is a paragraph of body content."
                          }
              }
            ]
}.to_json

image = Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'featured_image.png'), 'image/png')

(1..2).each do |i|
  author = AdminUser.create! name: "Author #{i}", email: "author#{i}@thetallgrass.net", password: SecureRandom.base64(12)
  column = Article::Column.create! name: "Column #{i}", description: "Column #{i}"
  column.authors << author

  (1..10).each do |j|
    x = (10 * (i - 1)) + j
    Article::Post.create! headline: "Article #{x}", subhead: "This is the #{x.ordinalize} article", body: body, published_at: (20 - x).days.ago, author: author, column: column, featured: (x % 2 == 0), featured_image: image
  end
end
