require 'test_helper'

class ContactPhoneValidationTest < ActiveSupport::TestCase

    setup do
        @test_contact = Contact.find_by_name 'Ned Nederlander'
        Contact.destroy_all
    end

    test "it should have valid format" do
        valid_email_contact = Contact.new name: @test_contact.name,
                                            email: @test_contact.email,
                                            phone: "123-456-5555",
                                            birthday: Time.now
                                            
        assert valid_email_contact.valid?
    end

    test "it should have valid format, and is in 7 digit format" do
        valid_email_contact = Contact.new name: @test_contact.name,
                                            email: @test_contact.email,
                                            phone: '123-5555',
                                            birthday: Time.now
                                            
        assert valid_email_contact.valid?
    end

    test "it should have valid format, and is in 10 digit format" do
        valid_email_contact = Contact.new name: @test_contact.name,
                                            email: @test_contact.email,
                                            phone: '555-555-5555',
                                            birthday: Time.now
                                            
        assert valid_email_contact.valid?
    end

    test "it should have a valid email format, not be nil" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: @test_contact.email,
                                            phone: nil,
                                            birthday: Time.now
        assert !invalid_email_contact.valid?
    end

    test "it should have a valid email format, not be empty string" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: @test_contact.email,
                                            phone: "",
                                            birthday: Time.now
        assert !invalid_email_contact.valid?
    end

    test "it should have a valid email format, not be bad format" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: @test_contact.email,
                                            phone: "654-45",
                                            birthday: Time.now
        assert !invalid_email_contact.valid?
    end

end
