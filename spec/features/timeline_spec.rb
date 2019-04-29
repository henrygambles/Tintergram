require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them 📝" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can see date and time posts submitted ⏰" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    created_at = Post.all[0].created_at.strftime('%H:%M, %-d %B')
    expect(page).to have_content(created_at)
  end

  scenario "Can see posts in reverse chronological order ⌛" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Hello, world again!"
    click_button "Submit"
    expect("Hello, world again!").to appear_before "Hello, world!"
  end

  scenario "Can submit post with line breaks ✍️" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "New\nline breaks\nin this message"
    click_button "Submit"
    expect(page.body).to include("New\n<br />line breaks\n<br />in this message")
  end

  xscenario "Can submit pictures and view them 🖼️" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Cat Bread!!"
    # attach_file("Choose file", Rails.root + "spec/fixtures/cat-bread.jpg")
    # click_button "Choose file"
    # attach_file('data-file', 'path/to/file.csv')
    # attach_file('image', 'spec/fixtures/cat-bread.jpg', make_visible: false)
    # attach_file('spec/fixtures/cat-bread.jpg')

    # click_button "post_image"
    
    attach_file('post_image', File.absolute_path('spec/fixtures/cat-bread.jpg'), make_visible: true)

    # find('form input[type="file"]').set('spec/fixtures/cat-bread.jpg')

    click_button "Submit"
    expect(page).to have_content("Cat Bread!!")
  end
end
