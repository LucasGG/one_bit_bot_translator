SimpleCov.start do
  enable_coverage :branch

  add_group 'Services', 'app/services'
  add_group 'App', 'app.rb'

  add_filter ['/spec/', '/bin/', '/config/']

  formatter SimpleCov::Formatter::SimpleFormatter if ENV['CI']

  minimum_coverage 100
end
