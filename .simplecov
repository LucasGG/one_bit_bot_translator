SimpleCov.start do
  enable_coverage :branch

  add_group 'Services', 'app/services'

  add_filter ['/spec/', '/bin/']
end
