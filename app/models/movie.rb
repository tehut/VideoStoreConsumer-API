class Movie < ApplicationRecord
  attr_accessor :external_id

  has_many :rentals
  has_many :customers, through: :rentals

  def available_inventory
    self.inventory - Rental.where(movie: self, returned: false).length
  end

  def image_url
    orig_value = read_attribute :image_url
    puts orig_value.class
    # if orig_value == nil
    if !orig_value
      MovieWrapper::DEFAULT_IMG_URL
    else
      MovieWrapper.construct_image_url(orig_value)
    end
  end
end
