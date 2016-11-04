class Category < ActiveRecord::Base
  
  validates :name, presence: true
  
  RailsAdmin.config do |config|
    config.model 'Category' do
      visible do
        bindings[:controller]._current_user.role.name  == 'admin'
      end
    end
  end
  
end
