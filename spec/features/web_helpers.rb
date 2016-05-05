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
  fill_in :email, with: 'my_email_address'
  fill_in :password, with: 'password'
  click_button 'Signup'
end
