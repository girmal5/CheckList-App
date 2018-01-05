class BydayController < ApplicationController


  def index
    if (user_signed_in?)
       	@items = current_user.items

        # @task = @tasks.find_by(date: Time.now.strftime("%d/%m/%Y"))

      	@dates = @items.group(:date).map(&:date).uniq

       	@items_perday = @items.where(date: Time.now.strftime("%d/%m/%Y"))


  end
end

end
