# frozen_string_literal: true

RSpec.describe GuessFavouriteLanguage do
  def subject(github_repos)
    described_class.call(github_repos)
  end

  def languages_to_github_repos(languages)
    languages.map { |lang| FactoryBot.build(:github_repo, language: lang) }
  end

  def subject_from_languages(languages)
    subject(languages_to_github_repos(languages))
  end

  it "makes a guess based on repos' primary languages" do
    expect(subject_from_languages(%w[ruby ruby ruby js ruby js js])).to eq 'ruby'
    expect(subject_from_languages(%w[ruby js ruby js js])).to eq 'js'
  end

  it 'takes the first one when multiple languages are tied' do
    expect(subject_from_languages(%w[c ruby ruby js js])).to eq 'ruby'
  end

  it 'ignores repos with no language (null)' do
    expect(subject_from_languages([nil, 'c', nil])).to eq 'c'
  end
end
