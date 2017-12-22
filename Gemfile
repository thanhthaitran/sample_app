source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rubocop", "~> 0.51.0"
gem "minitest", "5.10.3"
gem "minitest-reporters", "1.1.19"
gem "rails-controller-testing", "1.0.2"
gem "bootstrap-sass", "3.3.7"
gem "jquery-rails", "4.3.1"
gem "bcrypt", "3.1.11"
gem "faker", "1.8.5"
gem "will_paginate", "3.1.6"
gem "bootstrap-will_paginate", "1.0.0"
gem "config", "1.6.1"
gem "rails", "~> 5.1.4"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"

group :development, :test do
  gem "guard", "2.14.1"
  gem "guard-minitest", "2.4.6"
  gem "guard-rspec", "4.7.3"
  gem "sqlite3", "1.3.13"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
group :production do
  gem "pg", "~> 0.21.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
