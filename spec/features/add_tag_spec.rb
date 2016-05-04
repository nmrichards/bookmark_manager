feature 'tagging' do
  scenario 'add a tag to a link' do
    visit('/links/new')
    fill_in :title, with: 'Google'
    fill_in :url, with: 'www.google.com'
    fill_in :tag, with: 'search engine'
    click_button 'Submit'
    expect(current_path).to eq '/links'
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('search engine')
  end
end
