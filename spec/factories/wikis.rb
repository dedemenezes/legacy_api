# frozen_string_literal: true

FactoryBot.define do
  factory :bones_family, class: "Wiki" do
    title { "Bones family" }
    path { "/wiki/Bones_family" }
  end

  factory :dursley, class: "Wiki" do
    title { "Dudley Dursley" }
    path { "/wiki/Dudley_Dursley" }
  end
end
