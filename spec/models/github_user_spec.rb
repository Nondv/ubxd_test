# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GithubUser do
  shared_examples 'delegate' do |method|
    it "delegates ##{method} to the resource" do
      expect(described_class.new(double(method => 'bla-bla')).send(method)).to eq 'bla-bla'
      expect(described_class.new(double(method => nil)).send(method)).to be nil
    end
  end

  include_examples 'delegate', :name
  include_examples 'delegate', :bio
  include_examples 'delegate', :avatar_url

  it '#username' do
    expect(described_class.new(double(login: 'bla-bla')).username).to eq 'bla-bla'
  end

  it '#to_h just converts it to a hash' do
    resource = double(bio: 'mybio', name: 'John Doe', login: 'johndoe', avatar_url: '//someurl')
    expected_hash = { bio: 'mybio', name: 'John Doe', username: 'johndoe', avatar_url: '//someurl' }
    expect(described_class.new(resource).to_h).to eq(expected_hash)
  end
end
