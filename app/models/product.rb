class Product < ActiveRecord::Base
  belongs_to :category
  
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" 
    }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method: 
  attr_accessor :delete_photo
  before_validation { self.photo.clear if self.delete_photo == '1' }
  
  RailsAdmin.config do |config|
    config.model 'Product' do
      visible do
        bindings[:controller]._current_user.role.name  == 'admin'
      end
    end
  end
  
end
