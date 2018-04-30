source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap'
gem 'cancancan'
gem 'carrierwave', '~> 1.0'
gem 'chosen-rails'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'faker'
gem 'geocoder'
gem 'gmaps4rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'meetup_client'
gem "mini_magick"
gem 'news-api'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pry-rails'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.6'
gem 'sass-rails', '~> 5.0'
gem "simple_calendar", "~> 2.0"
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'
gem 'underscore-rails'
gem 'meetup_client'

gem 'news-api'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
