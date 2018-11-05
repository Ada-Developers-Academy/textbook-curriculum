require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  describe "index" do
    # These tests are a little verbose - yours do not need to be
    # this explicit.
    it "is a real working route" do
      get pets_path
      must_respond_with :success
    end

    it "returns json" do
      get pets_path
      expect(response.header['Content-Type']).must_include 'json'
    end

    it "returns an Array" do
      get pets_path

      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it "returns all of the pets" do
      get pets_path

      body = JSON.parse(response.body)
      body.length.must_equal Pet.count
    end

    it "returns pets with exactly the required fields" do
      keys = %w(age human id name)
      get pets_path
      body = JSON.parse(response.body)
      body.each do |pet|
        pet.keys.sort.must_equal keys
      end
    end
  end

  describe "show" do
    # This bit is up to you!
    it "can get a pet" do
      get pet_path(pets(:two).id)
      must_respond_with :success
    end
    
    it "responds with a 404 message if no pet is found" do
      id = -1
      get pet_path(id)
      must_respond_with :not_found
    end
  end

  describe "create" do
    let(:pet_data) {
      {
        name: "Jack",
        age: 7,
        human: "Captain Barbossa"
      }
    }

    it "creates a new pet given valid data" do
      expect {
      post pets_path, params: { pet: pet_data }
    }.must_change "Pet.count", 1

      body = JSON.parse(response.body)
      expect(body).must_be_kind_of Hash
      expect(body).must_include "id"

      pet = Pet.find(body["id"].to_i)

      expect(pet.name).must_equal pet_data[:name]
      must_respond_with :success
    end

    it "returns an error for invalid pet data" do
      # arrange
      pet_data["name"] = nil

      expect {
      post pets_path, params: { pet: pet_data }
    }.wont_change "Pet.count"

      body = JSON.parse(response.body)

      expect(body).must_be_kind_of Hash
      expect(body).must_include "errors"
      expect(body["errors"]).must_include "name"
      must_respond_with :bad_request
    end

  end
end


