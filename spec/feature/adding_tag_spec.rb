feature 'add a tag' do
  scenario 'adds a tag to existing link' do
    visit '/links/new'
    fill_in :Title, with:  'eBay'
    fill_in :URL, with: 'www.ebay.com'
    fill_in :Tag, with: 'Shopping'
    click_button "Save"
    link = Link.first
    expect(link.tag.map(&:name)).to include("Shopping")
  end
end
