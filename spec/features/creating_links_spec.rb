feature 'links to add the site' do
	scenario 'save links' do
	visit '/links/new'
  fill_in :title, with: 'Facebook'
  fill_in :url, with: 'http://facebook.com'
  fill_in :tags, with: 'Social'
  click_button 'Submit'
  expect(current_path).to eq '/links'

  within 'ul#links' do
    expect(page).to have_content('Facebook')
    expect(page).to have_content('Social')
  end
	end
end

