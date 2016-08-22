Rails.application.configure do
  config.browserify_rails.commandline_options = '-t coffeeify --extension=".js.coffee"'
  config.browserify_rails.commandline_options << ' -t [ babelify --presets [ es2015 ] --extensions .js ]'
end
