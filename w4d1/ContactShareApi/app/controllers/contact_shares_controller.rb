class ContactSharesController < ApplicationController
  def create
    @contact_share = contact_share.new(contact_share_params)
    if @contact_share.save
      render json: @contact_share
    else
      render json: @contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact_share = contact_share.find(params[:id])
    render json: @contact_share.destroy
  end

private

  def contact_share_params
    self.params.require(:contact_share).permits(:user_id, :contact_id)
  end
end
