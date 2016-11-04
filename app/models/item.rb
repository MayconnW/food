class Item < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product
  
  validates :product, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  
  RailsAdmin.config do |config|
    config.label_methods.unshift(:display_name)  
    config.model 'Item' do
      visible false
      edit do 
        field :product
        field :quantity
        field :to_go
      end
    end
  end
  
  def display_name
    if product
      product.name
    end
  end
  
end
