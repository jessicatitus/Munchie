require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in "First Name", with: "Jess"
    fill_in "Last Name", with: "Titus"
    fill_in "Email", with: "JET@s-mart.com"
    fill_in "Password", with: "powerade123"
    fill_in "Password Confirmation", with: "powerade123"
    attach_file "Profile Photo", "#{Rails.root}/spec/support/images/chio-day-quotes.jpg"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_css("img[src*='chio-day-quotes.jpg']")
  end
end
