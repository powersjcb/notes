require 'rails_helper'

feature "Can move from link index to new" do
  context "when logged in" do
    before :each do
      sign_up_as_ginger_baker
      visit '/links'
    end

    it "link index has a 'New Link' link to new link page" do
      expect(page).to have_content "New Link"
    end
  end
end

feature "Creating a link" do
  context "when logged in" do
    before :each do
      sign_up_as_ginger_baker
      visit '/links/new'
    end

    it "has a new link page" do
      expect(page).to have_content 'New Link'
    end

    it "takes a title and a url" do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'URL'
    end

    it "validates the presence of title" do
      fill_in 'URL', with: 'http://google.com'
      click_button 'Create New Link'
      expect(page).to have_content 'New Link'
      expect(page).to have_content "Title can't be blank"
    end

    it "validates the presence of url" do
      fill_in 'Title', with: 'google'
      click_button 'Create New Link'
      expect(page).to have_content 'New Link'
      expect(page).to have_content "Url can't be blank"
    end

    it "redirects to the link show page" do
      fill_in 'URL', with: 'http://google.com'
      fill_in 'Title', with: 'google'
      click_button 'Create New Link'

      expect(current_path).to match(/^\/links\/(\d)+/)
      expect(page).to have_content 'google'
    end

    context "on failed save" do
      before :each do
        fill_in 'Title', with: 'google'
      end

      it "displays the new link form again" do
        expect(page).to have_content 'New Link'
      end

      it "has a pre-filled form (with the data previously input)" do
        expect(find_field('Title').value).to eq('google')
      end

      it "still allows for a successful save" do
        fill_in 'URL', with: 'http://google.com'
        click_button 'Create New Link'
        expect(page).to have_content 'google'
      end
    end
  end

  context "when logged out" do
    it "redirects to the login page" do
      visit '/links/new'
      expect(page).to have_content 'Sign In'
    end
  end
end

feature "Seeing all links" do
  context "when logged in" do
    before :each do
      sign_up("foo")
      make_link("yahoo", "http://yahoo.com")
      click_on "Sign Out"
      sign_up_as_ginger_baker
      make_link("google", "http://google.com")
      make_link("amazon", "http://amazon.com")
      visit '/links'
    end

    it "shows all the links for all users" do
      expect(page).to have_content 'google'
      expect(page).to have_content 'yahoo'
      expect(page).to have_content 'amazon'
    end

    it "shows the current user's username" do
      expect(page).to have_content 'ginger_baker'
    end

    it "links to each of the link's show page via link titles" do
      click_link 'google'
      expect(page).to have_content 'google'
      expect(page).to_not have_content 'yahoo'
      expect(page).to_not have_content 'amazon'
    end
  end

  context "when logged out" do
    it "redirects to the login page" do
      visit '/links'
      expect(page).to have_content 'Sign In'
    end
  end

  context "when signed in as another user" do
    before :each do
      sign_up('ginger_baker')
      click_button 'Sign Out'
      sign_up('goodbye_world')
      make_link("facebook", "http://facebook.com")
      click_button 'Sign Out'
      sign_in('ginger_baker')
    end

    it "shows others links" do
      visit '/links'
      expect(page).to have_content 'facebook'
    end
  end
end

feature "Showing a link" do
  context "when logged in" do
    before :each do
      sign_up('ginger_baker')
      make_link("google", "http://google.com")
      visit '/links'
      click_link 'google'
    end

    it "shows the current user's username" do
      expect(page).to have_content 'ginger_baker'
    end

    it "displays the link title" do
      expect(page).to have_content 'google'
    end

    it "displays the link url" do
      expect(page).to have_content 'http://google.com'
    end

    it "displays a link back to the link index" do
      expect(page).to have_content "Links"
    end
  end
end

feature "Editing a link" do
  before :each do
    sign_up_as_ginger_baker
    make_link("google", "http://google.com")
    visit '/links'
    click_link 'google'
  end

  it "has a link on the show page to edit a link" do
    expect(page).to have_content 'Edit Link'
  end

  it "shows a form to edit the link" do
    click_link 'Edit Link'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'URL'
  end

  it "has all the data pre-filled" do
    click_link 'Edit Link'
    expect(find_field('Title').value).to eq('google')
    expect(find_field('URL').value).to eq('http://google.com')
  end

  it "shows errors if editing fails" do
    click_link 'Edit Link'
    fill_in 'URL', with: ''
    click_button 'Update Link'
    expect(page).to have_content "Edit Link"
    expect(page).to have_content "Url can't be blank"
  end

  context "on successful update" do
    before :each do
      click_link 'Edit Link'
    end

    it "redirects to the link show page" do
      fill_in 'Title', with: 'DuckDuckGo'
      click_button 'Update Link'
      expect(page).to have_content 'DuckDuckGo'
    end
  end
end
