# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FetchGithubUserByUsername do
  def subject(username, client)
    described_class.call(username, client)
  end

  it 'uses octokit #user and returns GithubUser' do
    client = double
    allow(client).to(
      receive(:user)
        .with('blabla')
        .and_return(double(name: 'Bla Bla'))
    )

    result = subject('blabla', client)
    expect(result).to be_a(GithubUser)
    expect(result.name).to eq 'Bla Bla'
  end

  it 'raises NotFoundError on 404' do
    client = double
    allow(client).to receive(:user) { raise Octokit::NotFound }

    expect { subject('asdf', client) }.to raise_error(GithubApiErrors::NotFoundError)
  end

  it 'handles requests number limit error' do
    client = double
    allow(client).to receive(:user) { raise Octokit::TooManyRequests }

    expect { subject('asdf', client) }.to raise_error(GithubApiErrors::TooManyRequestsError)
  end

  it 'is not handling other errors' do
    client = double
    err = RuntimeError.new 'asfd'
    allow(client).to receive(:user) { raise err }

    expect { subject('asdf', client) }.to raise_error(err)
  end
end
