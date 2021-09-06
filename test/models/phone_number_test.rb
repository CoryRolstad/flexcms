require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase

  setup do
    @sut = PhoneNumber.first    
    @contact = Contact.new  name: "Andrew Jackson",
                            email: "jack@jackson.com",
                            birthday: Time.now,
                            note: "Great!"
    @contact.save
  end

  test "it should have valid format" do
    sut = PhoneNumber.new contact_id: @contact.id,
                              number: @sut.number,
                              primary: @sut.primary,
                              description: @sut.description
    assert sut.valid?    
  end

  test "it should have valid format, and has to have a valid contact" do
    sut = PhoneNumber.new contact_id: 900,
                              number: @sut.number,
                              primary: @sut.primary,
                              description: @sut.description
    assert !sut.valid?    
  end

  test "it should have valid format, and has to have a valid telephone number" do
    sut = PhoneNumber.new contact_id: @contact.id,
                              number: "100",
                              primary: @sut.primary,
                              description: @sut.description
    assert !sut.valid?    
  end

  test "it should have valid format, and has to have a non null telephone number" do
    sut = PhoneNumber.new contact_id: @contact.id,
                              number: nil,
                              primary: @sut.primary,
                              description: @sut.description
    assert !sut.valid?    
  end

  test "it should have valid format, and has to a description of Home|Mobile|Work|Fax" do
    sut = PhoneNumber.new contact_id: @contact.id,
                              number: @sut.number,
                              primary: @sut.primary,
                              description: "Work"
    assert sut.valid? 
    sut.description="Mobile"
    assert sut.valid?
    sut.description="Home"
    assert sut.valid?
    sut.description="Fax"
    assert sut.valid?

    sut.description="Not Working"
    assert !sut.valid?
  end

end
