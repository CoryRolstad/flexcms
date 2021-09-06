require 'test_helper'

class ContactEmailValidationTest < ActiveSupport::TestCase

    setup do
        @test_contact = Contact.find_by_name 'Ned Nederlander'
    end

    test "it should have valid format" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: 'test@gmail.com',
                                            birthday: Time.now - 21.years
                                            
        assert invalid_email_contact.valid?
    end

    test "it should have valid format, not missing email prefix" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: '@gmail.com',
                                            birthday: Time.now - 21.years
                                            
        assert !invalid_email_contact.valid?
    end

    test "it should have a valid format, not missing email suffex" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: 'test@',
                                            birthday: Time.now - 21.years
        assert !invalid_email_contact.valid?
    end

    test "it should have a valid email format, not just a string" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: 'test',
                                            birthday: Time.now - 21.years
        assert !invalid_email_contact.valid?
    end

    test "it should have a valid email format, not be nil" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: nil,
                                            birthday: Time.now - 21.years
        assert !invalid_email_contact.valid?
    end


end
