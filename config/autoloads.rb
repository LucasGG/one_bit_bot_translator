# frozen_string_literal: true

# Declaration of autoloads for App.

app_dir = File.expand_path(File.join(__dir__, '../app'))

autoload('Service', File.join(app_dir, 'services/service.rb'))
autoload('Yandex', File.join(app_dir, 'services/yandex.rb'))
autoload('DialogFlow', File.join(app_dir, 'services/dialog_flow.rb'))
autoload('ActionResolver', File.join(app_dir, 'services/action_resolver.rb'))
