require 'tilt/erb'
feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    link = Link.create(url: 'http://www.google.com', title: 'Google')

    visit '/links'

    expect(page.status_code).to eq 200

    expect(page).to have_content('Google')
  end
end
