feature "signing up" do
  scenario "user signs up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Hello my_email_address!"
    expect(User.first.email).to eq('my_email_address')
    # user = User.create(name: 'amy', username: 'amynic', email: 'email', password: 'password')
    # expect(user.email).to eq 'email'
    #expect { User.create(name: 'amy', username: 'amynic', password: 'password', email: 'email') }.to change { User.count }.by(1)
  end
end
