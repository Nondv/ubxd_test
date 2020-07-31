# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FetchPublicReposByUsername do
  def subject(username, client)
    described_class.call(username, client)
  end

  it 'uses octokit #repos and returns Array<GithubRepo>' do
    client = double
    allow(client).to(
      receive(:repos)
        .with('blabla')
        .and_return([double(name: 'rails'), double(name: 'ruby')])
    )

    result = subject('blabla', client)
    result.each { |x| expect(x).to be_a(GithubRepo) }
    expect(result.map(&:name)).to eq ['rails', 'ruby']

    allow(client).to receive(:repos).with('asdf').and_return([])
    expect(subject('asdf', client)).to eq []
  end

  it 'raises NotFoundError on 404' do
    client = double
    allow(client).to receive(:repos) { raise Octokit::NotFound }

    expect { subject('asdf', client) }.to raise_error(described_class::NotFoundError)
  end

  it 'is not handling other errors' do
    client = double
    err = RuntimeError.new 'asfd'
    allow(client).to receive(:repos) { raise err }

    expect { subject('asdf', client) }.to raise_error(err)
  end
end
