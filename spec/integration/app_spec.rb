require "spec_helper"
require_relative "../../app.rb"
require "rack/test"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it "returns Julia, Mary, Karim" do
      response = get("/names")

      expect(response.status).to eq 200
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "GET /hello" do
    it "returns hello name" do
      response = get("/hello?name=Leo")

      expect(response.status).to eq 200
      expect(response.body).to eq("Hello Leo")
    end
  end

  context "POST /sort-names" do
    it "returns names sorted alphabetically" do
      response = post("/sort-names?names=Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq 200
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end
