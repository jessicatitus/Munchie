require "rails_helper"

feature "New users can create an account" do
  scenario "New user creates account successfully" do

    visit new_user_registration_path
    expect(page).to have_content "Sign up"

    fill_in "First Name", with: "Jess"
    fill_in "Last Name", with: "Titus"
    fill_in "Password", with: "JET123"
    fill_in "Password Confirmation", with: "JET123"
    fill_in "Email", with: "JET@email.com"
    # attach_file "Profile photo",
    #   "#{Rails.root}/spec/support/images/featmeme.jpg"

    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully"
    expect(page).to have_content "Munchie"
  end

  scenario "New user does not provide proper information to create"\
  " a new account" do

    visit new_user_registration_path
    expect(page).to have_content "Sign up"

    click_button "Sign up"

    expect(page).to have_content "First Name can't be blank"
    expect(page).to have_content "Last Name can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
