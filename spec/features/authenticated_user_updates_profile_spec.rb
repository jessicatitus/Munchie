require "rails_helper"

feature "Authenticated user can update their profile information" do

  let!(:jess) do
    User.create(
      first_name: 'Jess',
      last_name: 'Titus',
      password: 'JET123',
      # profile_photo: "http://i.imgur.com/jluf593.jpg",
      email: 'JET@email.com'
    )
  end

  scenario "Authenticated user updates their profile information" do
    visit root_path

    click_on "Log In"

    fill_in "Password", with: "JET123"
    fill_in "Email", with: "JET@email.com"

    click_button "Log in"

    click_on "Jess"

    expect(page).to have_content "Edit User"
    expect(page).to have_content "First Name"
    expect(page).to have_content "Last Name"
    expect(page).to have_content "Password"
    # expect(page).to have_content "Profile photo"
    expect(page).to have_content "Email"

    fill_in "Current password", with: "JET123"

    expect(page).to have_field("First Name", with: jess.first_name)
    expect(page).to have_field("Last Name", with: jess.last_name)
    expect(page).to have_field("Email", with: jess.email)

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully"
  end
end
