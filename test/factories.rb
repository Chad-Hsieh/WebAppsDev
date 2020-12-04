FactoryBot.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test User #{n}" }
        f.sequence(:email) { |n| "test#{n}@example.com"}
        f.password { "password" }
        f.password_confirmation { |d| d.password }
    end
    factory :photo do |f|
        f.sequence(:photo_url) { |n| "Photo_url#{n}" }
        f.sequence(:description) {|n| "Photo_description #{n}" }
        f.sequence(:hashtag) { |n| "Photo_hashtag #{n}" }
        f.association :user
    end
    # factory :comment do |f|
    #     f.sequence(:content) { |n| "Test Comment #{n}" }
    #     f.time { Time.zone.now+1.day }
    #     f.association :user
    # end
end