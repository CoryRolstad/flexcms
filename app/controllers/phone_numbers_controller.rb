class PhoneNumbersController < ApplicationController
    def index
      @phone_numbers = PhoneNumber.order(params[:sort]).page(params[:page]).per_page(20)
    end
  
    def destroy
      PhoneNumber.find(params[:id]).destroy
      flash[:success] = "The contact was successfully deleted."
      redirect_to :root
    end
  
    def show
    end
  
    def edit
      @phone_number = PhoneNumber.find(params[:id])
      @phone_number.update_attributes(phone_number_params)
    end
  
    def destroy
        @phone_number = PhoneNumber.find(params[:id])
        @phone_number.destroy
        redirect_to :root
    end

    def new
    end
  
    def create
      @phone_number = PhoneNumber.new phone_number_params
      @phone_number.save
  
      if @phone_number.errors.any?
        render :new
      else
        redirect_to contacts_path
      end
    end
  
    def phone_number_params
      if params[:phone_number]
        params.require(:contact).permit(
          :id,
          :contact_id,
          :number,
          :primary,
          :description
        )
      end
    end
  
  end
  