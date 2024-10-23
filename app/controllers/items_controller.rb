# frozen_string_literal: true

require_relative '../domain/items/filter'

class ItemsController < ApplicationController
  def show
    @item = Item.find_by!(uuid: params[:uuid])

    render json: @item.slice(:uuid, :price, :brand, :photo_url, :status, :user_id)
  end

  def index
    filtered_items = Items::Filter.for(params[:brand], params[:status])
    per_page = 2
    paginate_items = filtered_items.page(params[:page]).per(per_page)

    render json: { items: paginate_items.map do |item|
      item.slice(:uuid, :price, :brand, :photo_url, :status, :user_id)
    end }
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: { message: 'Item successfully created!' }, status: :created
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find_by!(uuid: params[:uuid])

    if @item.update(item_params)
      render json: { message: 'Item successfully updated!' }, status: :ok
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find_by!(uuid: params[:uuid])

    if @item.destroy
      render json: { message: 'Item successfully deleted!' }, status: :ok
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:price, :brand, :photo_url, :status, :user_id)
  end
end
