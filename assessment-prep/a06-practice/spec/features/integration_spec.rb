require 'spec_helper'

feature 'Posts Index' do
  given!(:post1) { FactoryGirl.create(:post) }
  given!(:post2) { FactoryGirl.create(:post) }
  given!(:post3) { FactoryGirl.create(:post) }

  it 'renders the Post Index template into $rootEl', js: true do
    visit '#'
    expect(page).to have_content(post3.title)
  end

  it 'deletes a Post', js: true do
    visit '#'
    first(:button, 'Delete').click
    expect(page).to have_no_content(post1.title)
  end
end

feature 'Posts Show' do
  given!(:post1) { FactoryGirl.create(:post) }

  it 'renders the Post Show template into $rootEl', js: true do
    visit "#/posts/#{post1.id}"
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.body)
  end
end

feature 'Make a Post' do
  it 'renders the Post Form template into $rootEl', js: true do
    visit '#/posts/new'
    expect(page).to have_content("New Post")
  end

  it 'successfully creates a new post and redirects to index', js: true do
    make_one_post("First", "What a great post")
    expect(page).to have_content("First")
  end
end

feature 'Edit a Post' do
  given!(:editable) { FactoryGirl.create(:post) }

  it 'renders the Post Form tmeplate into the $rootEl', js: true do
    visit "#/posts/#{editable.id}/edit"
    expect(page).to have_content('Edit Post')
  end

  it 'successfully edits a post and redirects to index', js: true do
    edit_post(editable, "Another exemplary post")
    expect(page).to have_content("Another exemplary post")
  end
end
