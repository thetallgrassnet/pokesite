Rails.application.configure do
  config.browserify_rails.commandline_options = '-t coffeeify --extension=".js.coffee"'
end
