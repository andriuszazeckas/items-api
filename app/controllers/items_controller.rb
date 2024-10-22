# frozen_string_literal: true

require_relative '../domain/items/filter'

class ItemsController < ApplicationController
  def show
    @item = Item.find_by(uuid: params[:uuid])

    render json: {
      uuid: @item.uuid,
      price: @item.price,
      brand: @item.brand,
      photo_url: @item.photo_url,
      status: @item.status,
      user_uuid: @item.uuid,
    }
  end

  def index
    filtered_items = Items::Filter.for(params[:brand], params[:status]).page(params[:page]).per(2)

    items_output(filtered_items)

    # render json: {
    #   items: filtered_items.map { |item| { id: item.id, brand: item.brand, status: item.status } },
    # }
  end

  # def index
  #   brand_param = params[:brand]
  #   status_param = params[:status]
  #
  #   filter = Items::Filter.new(brand_param, status_param)
  #   filtered_items = filter.run
  #   items_output(filtered_items)
  # end

  def items_output(items = nil?)
    render json: {
      items: items.map do |item|
        { uuid: item.uuid, brand: item.brand, status: item.status, price: item.price,
          photo_url: item.photo_url, user_id: item.user_id }
      end,
    }
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: { message: 'Item successfully updated!' }, status: :created
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find_by(uuid: params[:uuid])
    if @item.update(item_params)
      render json: { message: 'Item successfully updated!' }, status: :ok

    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find_by(uuid: params[:uuid])
    if @item.destroy
      render json: { message: 'Item successfully deleted!' }, status: :ok
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:price, :brand, :photo_url, :status, :user_id)
  end
end
