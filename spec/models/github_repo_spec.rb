# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GithubRepo do
  shared_examples 'delegate' do |method|
    it "delegates ##{method} to the resource" do
      expect(described_class.new(double(method => 'bla-bla')).send(method)).to eq 'bla-bla'
      expect(described_class.new(double(method => nil)).send(method)).to be nil
    end
  end

  include_examples 'delegate', :language
  include_examples 'delegate', :name
end
