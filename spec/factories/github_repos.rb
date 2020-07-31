FactoryBot.define do
  factory :github_repo do
    initialize_with do
      resource = OpenStruct.new(attributes)
      new(resource)
    end

    sequence(:name) { |i| "Repo #{i}" }
    language { nil }
  end
end
