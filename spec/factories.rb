FactoryGirl.define do
	factory :user do
		sequence(:name)  { |n| "Giles the #{n}" }
    sequence(:email) { |n| "librarian_#{n}@sunnydale.edu"}
    password "sl4yerf1rst"
    password_confirmation "sl4yerf1rst"
    
		factory :admin do
			admin true
		end
	end
end

FactoryGirl.define do
	factory :book do
		sequence(:title) { |n| "My Memoirs, Part #{n}"}
		sequence(:author) { |n| "Me"}
		sequence(:isbn) { |n| "971-62161-012#{n}"}
		sequence(:cover) { [ FactoryGirl.create(:image) ] }
		user
	end
end

FactoryGirl.define do
	factory :review do
		sequence(:title) { |n| "#{n} Out of 5 Stars" }
		sequence(:text) { |n| "There were lots of good parts, and lots of bad parts." }
		sequence(:fave_quote) { |n| "Beautiful quote goes here." }
		sequence(:user_id) { |n| "#{n}" }
		book
	end
end

FactoryGirl.define do
	factory :image do |img|
		img.image  fixture_file_upload( 'cover.jpg')
	end
end