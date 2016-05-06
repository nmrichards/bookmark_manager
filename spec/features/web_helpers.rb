def add_link
  visit '/links/new'
  fill_in :title, with:  'eBay'
  fill_in :url, with: 'www.ebay.com'
  fill_in :tags, with: 'Shopping'
  click_button "Submit"
end

def sign_up(password = 'oranges!')
  visit '/users/new'
  fill_in :email, with: 'johnsmith@gmail.com'
  fill_in :password, with: password
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end
