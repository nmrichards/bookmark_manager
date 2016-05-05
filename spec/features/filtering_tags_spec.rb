feature "filtering tags" do
  scenario "filter links by tag" do
    create_link_with_tag('search_engine')
    create_link_with_tag('bubbles')
    visit "/tags/bubbles"
    expect(page).to have_content 'Tag:bubbles'
    expect(page).not_to have_content 'Tag:seach_engine'
  end
end
