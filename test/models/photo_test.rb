require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test 'valid photo' do
    photo = FactoryBot.build :photo
    assert photo.valid?
  end
  
  test 'invalid without description' do
    photo = FactoryBot.build :photo
    photo.description = nil
    
    refute photo.valid?
  end
  
  test 'invalid without user' do
    photo = FactoryBot.build :photo
    photo.user = nil
    
    refute photo.valid?
  end
end
