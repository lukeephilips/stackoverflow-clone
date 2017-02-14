FactoryGirl.define do
  factory(:question) do
    # test_user = User.create(email: "b@b.com", password: "hi1")
    title('Does my test pass?')
    # user_id(test_user.id)
  end
  # factory(:user) do
  #   email("test")
  #   password("123")
  # end
end
