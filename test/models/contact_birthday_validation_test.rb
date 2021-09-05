require 'test_helper'

class ContactBirthdayValidationTest < ActiveSupport::TestCase

    setup do
        @test_contact = Contact.find_by_name 'Ned Nederlander'
        Contact.destroy_all
    end

    test "it should have valid format" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: @test_contact.email,
                                            phone: @test_contact.phone,
                                            birthday: Time.now - 21.years
                                            
        assert invalid_email_contact.valid?
    end

    test "it should have valid format, and not be nil" do
        invalid_email_contact = Contact.new name: @test_contact.name,
                                            email: @test_contact.email,
                                            phone: @test_contact.phone,
                                            birthday: nil
                                            
        assert !invalid_email_contact.valid?
    end

end