class ContactsController < ApplicationController
  def index
    @contacts = Contact.order(params[:sort]).page(params[:page]).per_page(20)
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:success] = "The contact was successfully deleted."
    redirect_to :root
  end

  def new
  end

  def create
    @contact = Contact.new params.require(:contact).
                                  permit(:name, :email, :phone, :birthday)
    @contact.save

    if @contact.errors.any?
      render :new
    else
      redirect_to contacts_path
    end
  end
end
