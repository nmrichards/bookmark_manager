feature 'create a link' do
  scenario 'save a bookmark with title and url' do
    visit '/links/new'
    fill_in :Title, with:  'eBay'
    fill_in :URL, with: 'www.ebay.com'
    click_button "Save"
    expect(page).to have_content "eBay"
  end
end
