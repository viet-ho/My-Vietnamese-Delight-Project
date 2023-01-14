class MainController < ApplicationController
  def index
    @title = 'Home'
  end

  def contact
    @title = 'Contact'
  end

  def menu
    @menu_items = MenuItem.all
  end

  def promo_item
    @promo_items = PromoItem.all
  end

end
