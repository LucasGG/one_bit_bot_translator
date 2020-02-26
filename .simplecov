SimpleCov.start do
  enable_coverage :branch
  minimum_coverage 55

  add_group 'Services', 'app/services'

  add_filter ['/spec/', '/bin/', '/db/', '/config/']
end
