source "https://rubygems.org"

group :test do
  gem "rspec", "~> 2.13"
  gem 'rspec-prof'
  if ENV["CI"]
    gem "coveralls", :require => false
  else
    gem "guard-rspec"
    gem "rb-fsevent"
  end
end

gem "rake"
gem "jruby-openssl", :platform => :jruby
gem 'msgpack-jruby', :require => 'msgpack', :platform => :jruby
gem 'msgpack-jruby', :require => 'msgpack', :platform => :jruby
gem 'atomic', "~> 1.1"

gemspec
