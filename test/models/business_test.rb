require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  def setup
    @business = 
      Business.new(
        name:         'some name',
        phone_number: 'phone number',
        email:        'example@example',
        business_url: 'some-name'
      )
  end

  test "valid_business" do
    assert @business.valid?
  end

  test "name is required" do
    @business.name = nil
    refute @business.valid?
  end

  test "business url must be unique" do
    @business.business_url = 'url-one'
    @business.save
    @business_two = @business.dup
    refute @business_two.save
    @business_two.business_url = 'url-two'
    assert @business_two.save
  end
end
