feature 'Sign in' do
  let!(:user) do
    User.create(email: 'batman@gmail.com',
                password: 'password',
                password_confirmation: 'password')
  end
  scenario 'allows user to sign in' do
    sign_in
    expect(page).to have_content("Welcome batman@gmail.com")
  end

  scenario 'does not authenticate when incorrect password/email combo' do
    visit "/sessions/new"
    fill_in :email, with: 'batman@gmail.com'
    fill_in :password, with: 'passwords'
    click_button 'Sign in'
    expect(current_path).to eq('/sessions')
  end
end
