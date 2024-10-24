# frozen_string_literal: true

module Items
  class Filter
    include Interactor::Initializer

    initialize_with :brand, :status

    def run
      items = Item.all
      items = items.where(brand: brand) if brand.present?
      items = items.where(status: status) if status.present?
      items
    end
  end
end
