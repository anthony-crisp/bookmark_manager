feature 'Tags' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end


  scenario 'I can add a single tag to a new link' do
    # visit '/links/new'
    # fill_in 'url',   with: 'http://www.makersacademy.com/'
    # fill_in 'title', with: 'Makers Academy'
    # fill_in 'tags',  with: 'education'
    #
    # click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'So I can see only links with a specific tag' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    # within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
    # end
    expect(page).to have_content('Bubble Bobble')
  end
end
feature 'Multi tags' do

  scenario 'I can add a multiple tags to a new link' do
    visit '/links/new'
    expect(page.status_code).to eq(200)
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education, learn, coding'
    click_button 'Create link'
    link = Link.first
    p "***HERE***", link.tags
    expect(link.tags.map(&:name)).to include('education')
    expect(link.tags.map(&:name)).to include('learn')

  end
end
