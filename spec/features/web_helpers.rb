def create_link_with_tag(tag)
  visit('/links/new')
  fill_in :title, with: 'Google'
  fill_in :url, with: 'www.google.com'
  fill_in :tag, with: tag
  click_button 'Submit'
end

def sign_up
  visit "/users/new"
  expect(page.status_code).to eq(200)
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  fill_in :email, with: 'batman@gmail.com'
  click_button 'Signup'
end

def sign_up_wrong
  visit "/users/new"
  expect(page.status_code).to eq(200)
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'wrong_password'
  fill_in :email, with: 'batman@gmail.com'
  click_button 'Signup'
end

def no_email
  visit "/users/new"
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  fill_in :email, with: nil
  click_button 'Signup'
end

def wrong_email
  visit "/users/new"
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  fill_in :email, with: 'asdf@asdf'
  click_button 'Signup'
end
