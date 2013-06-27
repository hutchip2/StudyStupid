source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Core frameworks
gem 'mysql2'
gem 'jquery-rails',           '2.3.0'

# Authentication
gem 'devise',                 '2.1.2'
gem 'omniauth-ldap',          '1.0.2'
gem 'omniauth-google-oauth2', '0.1.13'
gem 'omniauth-facebook',      '1.4.1'

# Authorization
gem 'activeadmin', '0.6.0'
gem 'cancan',      '1.6.9'

# Misc.
#gem 'carmen-rails', '~> 1.0.0.beta3'
gem 'carmen-rails', :git => 'https://github.com/jim/carmen-rails.git'
gem 'awesome_nested_set',              '~> 2.1.6'
gem 'active_admin-awesome_nested_set', '~> 0.0.5'
gem 'nested_form',                     '~> 0.3.2'
gem 'nokogiri',                        '~> 1.5.9'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier',       '>= 1.2.6'
  gem 'yui-compressor', '>= 0.9.6'
end

# bundler requires these gems in development
group :development do
end

group :test, :development do
  gem 'rspec-rails',        '~> 2.0'
  gem 'factory_girl_rails', '~> 4.0'
end

group :test do
  gem 'shoulda-matchers', '~> 1.0'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# To use debugger
# gem 'debugger'
