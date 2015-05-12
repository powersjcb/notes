class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    render json: @contact.destroy
  end


  def index
    # in scope of /user/:id/contacts
    @user = User.find(params[:user_id])
    @contacts = @user.created_contacts
    @shared_contacts = @user.shared_contacts
    render json: (@contacts + @shared_contacts).uniq
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

private

  def contact_params
    self.params.require(:contact).permit(:name, :email, :user_id)
  end
end
