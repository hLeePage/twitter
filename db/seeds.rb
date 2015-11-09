users = FactoryGirl.create_list(:user, 30)

users.each do |user|
  FactoryGirl.create_list(:tweet, 2, user: user)
end
