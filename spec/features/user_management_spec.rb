feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, johnsmith@gmail.com')
    expect(User.first.email).to eq('johnsmith@gmail.com')
  end

  scenario "A user won't be created if passwords are mismatched" do
    visit '/users/new'
    fill_in :email, with: 'johnsmith@gmail.com'
    fill_in :password, with: 'oranges!'
    fill_in :password_confirmation, with: 'apples?'
    click_button 'Sign up'
    expect(User.count).to eq 0
  end
end
