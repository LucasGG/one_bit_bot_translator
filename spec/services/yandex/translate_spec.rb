# frozen_string_literal: true

RSpec.describe Yandex::Translate do
  subject(:service) { described_class }

  let(:parameters) do
    {
      :text => 'Hello world',
      :ilang => 'en',
      :olang => 'pt',
      :format => 'plain',
      :options => nil
    }
  end

  before do
    WebMock.stub_request(:post, Yandex::Translate::URL)
           .to_return(
             :status => 200,
             :body => '{"code":200,"lang":"en-pt","text":["Olá mundo"]}'
           )
   end

  it('inherit service') { expect(service).to be < Service }

  it('translates text to another language') do
    expect(service.call(parameters)).to eq('Olá mundo')
  end
end
