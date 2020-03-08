# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    allow(Yandex::Translate).to(receive(:call)).and_return(3)
  end
end
