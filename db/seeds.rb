users = FactoryGirl.create_list(:tweet, 5)

users.each do |user|
  FactoryGirl.create_list(:tweet, 5, user: user)
end
