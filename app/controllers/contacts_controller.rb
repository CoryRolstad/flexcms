class ContactsController < ApplicationController
  def index
    @contacts = Contact.order(params[:sort]).page(params[:page]).per_page(20)
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:success] = "The contact was successfully deleted."
    redirect_to :root
  end

  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    @contact.update_attributes(contact_params)
  end


  def new
  end

  def create
    @contact = Contact.new contact_params
    @contact.save

    if @contact.errors.any?
      render :new
    else
      redirect_to contacts_path
    end
  end

  def contact_params
    if params[:contact]
      params.require(:contact).permit(:name, :email, :phone, :birthday)
    end
  end

end
