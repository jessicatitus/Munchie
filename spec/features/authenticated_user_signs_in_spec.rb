require "rails_helper"

feature "Authenticated user can sign in" do
  scenario "Authenticated user signs in successfully" do
    User.create(
      first_name: 'Jess',
      last_name: 'Titus',
      password: 'JET123',
      # profile_photo: "http://i.imgur.com/jluf593.jpg",
      email: 'JET@email.com'
    )
    visit new_user_session_path
    expect(page).to have_content "Log in"

    fill_in "Password", with: "JET123"
    fill_in "Email", with: "JET@email.com"

    click_button "Log in"

    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "Munchie"
  end

  scenario "Authenticated user does not provide proper information to log in" do
    visit new_user_session_path
    expect(page).to have_content "Log in"

    click_button "Log in"

    expect(page).to have_content "Invalid Email or Password."

  end
end
