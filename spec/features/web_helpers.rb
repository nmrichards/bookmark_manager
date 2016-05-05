def add_link
  visit '/links/new'
  fill_in :title, with:  'eBay'
  fill_in :url, with: 'www.ebay.com'
  fill_in :tags, with: 'Shopping'
  click_button "Submit"
end
