require "application_system_test_case"

class PhotosTest < ApplicationSystemTestCase
  test "index page shows all photos" do
    user = login_user
    photo1 = FactoryBot.create :photo, user: user
    photo2 = FactoryBot.create :photo, user: user
    
    visit photos_path
    
    assert_text photo1.description
    assert_text photo2.description
  
    # assert_selector "h1", text: "Photos"
  end
end
