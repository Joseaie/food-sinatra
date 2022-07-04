ENV['APP_ENV'] = 'test'

require_relative  '../app'  # <-- your sinatra app
require 'rspec'
require 'rack/test'
require ''

describe "Food app" do
    include Rack::Test::Methods
    include RSpecHtmlMatchers
  
    def app
      Sinatra::Application
    end

    it 'should not crash' do
        get '/'
        expect(last_response).to be_ok
    end

    it 'has a h1 tag' do
        get '/'
        expect(rendered).to have_tag('h1')
    end

    it 'has a nav' do
        get '/'
        expect(rendered).to have_tag('nav')
    end
end