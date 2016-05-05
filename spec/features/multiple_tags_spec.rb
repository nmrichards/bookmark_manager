feature 'Multiple Tags' do
  scenario 'user can add multiple tags to a link' do
    create_link_with_tag('search engine, bubbles')
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('search engine', 'bubbles')
    expect(page).to have_content "Title:Google URL:www.google.com Tags:search engine, bubbles"
  end
end
