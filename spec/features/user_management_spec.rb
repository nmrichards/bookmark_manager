feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, johnsmith@gmail.com')
    expect(User.first.email).to eq('johnsmith@gmail.com')
  end

  scenario "A user won't be created if passwords are mismatched" do
    sign_up('apples!')
    expect(User.count).to eq 0
  end

  scenario "mismatched passwords stays on new user page" do
    sign_up('apples!')
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password and confirmation password do not match")
  end
end
