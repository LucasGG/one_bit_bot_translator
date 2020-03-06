SimpleCov.start do
  enable_coverage :branch

  add_group 'Services', 'app/services'
  add_group 'App', 'app.rb'

  add_filter ['/spec/', '/bin/']
end
