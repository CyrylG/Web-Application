require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "POST /albums" do
    it "returns 200 OK" do
      # Assuming the post with id 1 exists.
      response = post("/albums?title=Voyage&release_year=2022&artist_id=2")

      expect(response.status).to eq(200)
      expect(response.body).to eq("")
      response = get('/albums')
      expect(response.body).to include ('Voyage')
    end
  end

  context "POST /artists" do
    it "returns 200 OK" do
      # Assuming the post with id 1 exists.
      response = post("/artists?name=Wild nothing&rgenre=Indie")

      expect(response.status).to eq(200)
      expect(response.body).to eq("")
      response = get('/artists')
      expect(response.body).to include ('Wild nothing')
    end
  end

  context 'GET /albums/1' do 
    it 'should return 200' do
      response = get('/albums/1')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Doolittle</h1>')
      expect(response.body).to include('Release year: 1989')
      expect(response.body).to include('Artist: Pixies')
    end
  end

  context 'GET /albums/2' do 
    it 'should return 200' do
      response = get('/albums/2')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end
  end
end
