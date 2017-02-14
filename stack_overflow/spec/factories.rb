FactoryGirl.define do
  factory(:question) do
    test_user = User.create(email: "b@b", password: "hi1")
    title('Does my test pass?')
    user_id(test_user)
  end
end
