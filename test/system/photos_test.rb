require "application_system_test_case"

class PhotosTest < ApplicationSystemTestCase
  test "index page shows all photos" do
    user = login_user
    photo1 = FactoryBot.create :photo, user: user
    photo2 = FactoryBot.create :photo, user: user
    
    visit photos_path
    
    assert_selector "h1", text: "Photos"
    assert_text photo1.description
    assert_text photo2.description
  
  end
  
  test "logged out users cannot see photos" do
    visit photos_path
    
    assert_equal page.current_path, login_path
    assert_text "You need to login"
  end
  
  test "create a new photo" do
    user = login_user
    visit photos_path
    
    click_on "New Photo"
    fill_in "Description", with: "description testing"
    fill_in "Hashtag", with: "hashtag testing"
    click_button "Create Photo"
    
    assert_text "Photo created"
    
  end
  
  test "update Photo testing" do
    user = login_user
    photo1 = FactoryBot.create :photo, user: user
    
    visit photo_path(photo1.id)
    click_on "Edit"
    fill_in "Description", with: "UPDATE description testing"
    fill_in "Hashtag", with: "UPDATE testing"
    click_button "Update Photo"
    
    assert_text "Photo updated"
  end
  
end
