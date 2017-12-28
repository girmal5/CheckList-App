class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :own_item, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
    # @items = Item.all.order("created_at DESC")
      @items = Item.where(:user_id => current_user.id).order("created_at DESC")
    end
  end

  def own_item
    unless current_user == @item.user
       flash[:alert] = "You cannot Modify this item."
       redirect_to root_path
    end
   end


  def new
    @item = current_user.items.build
  end

  def show
  end

  def complete
    @item = Item.find(params[:id])
    @item.update_attribute(:completed_at, Time.now)
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end


def destroy
  @item.destroy
  redirect_to root_path
end
  def create
    @user=current_user
    @item = current_user.items.build(item_params)
    if @item.save
      ExampleMailer.sample_email(@user).deliver_now
      redirect_to root_path
    else
      render 'new'
    end
  end

private def item_params
    params.require(:item).permit(:title, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end


end
