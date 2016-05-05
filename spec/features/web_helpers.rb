def create_link_with_tag(tag)
  visit('/links/new')
  fill_in :title, with: 'Google'
  fill_in :url, with: 'www.google.com'
  fill_in :tag, with: tag
  click_button 'Submit'
end
