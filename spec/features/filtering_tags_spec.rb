feature 'Filter tags' do
  scenario 'displays only filtered sites' do
    add_link
    visit '/links/new'
    fill_in :title, with:  'Amazon'
    fill_in :url, with: 'www.amazon.com'
    fill_in :tags, with: 'Shopping'
    click_button "Submit"
    visit '/links/new'
    fill_in :title, with:  'Hulu'
    fill_in :url, with: 'www.hulu.com'
    fill_in :tags, with: 'Media'
    click_button "Submit"
    visit '/tags/Shopping'
    expect(page).to have_content('Amazon')
    expect(page).not_to have_content('Hulu')
  end

  scenario 'displays multiple tags on a bookmark' do
    visit '/links/new'
    fill_in :tags, with: 'Media Entertainment'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Media', 'Entertainment')
  end
end
