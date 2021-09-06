require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  setup do
    @test_contact = Contact.find_by_name 'Ned Nederlander'
  end

  test "it should have a name" do
    @sut = Contact.new        name: "Roger Barbados",
                              email: @test_contact.email,
                              birthday: Time.now

    assert @sut.valid?
  end

  test "it should have a name, and cannot be null" do
    @sut = Contact.new name: nil,
                              email: 'test@fbsdata.com',
                              birthday: Time.now

    assert !@sut.valid?
  end

  test "it should have a unique name/email combo" do
    @sut = Contact.new name: @test_contact.name,
                              email: @test_contact.email,
                              birthday: Time.now
    assert !@sut.valid?
  end
end
