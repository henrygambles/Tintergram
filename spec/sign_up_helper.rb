def create_user_and_sign_up
  visit "/"
  fill_in("user_email", with: "henry@com")
  fill_in("user_password", with: "password")
  fill_in("user_password_confirmation", with: "password")
  click_button("Sign up")
end

def create_second_user_and_sign_in
  visit "/"
  fill_in("user_email", with: "theresa@com")
  fill_in("user_password", with: "password2")
  fill_in("user_password_confirmation", with: "password2")
  click_button("Sign up")
end
