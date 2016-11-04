class Waiter < ActiveRecord::Base
  
  RailsAdmin.config do |config|
    config.model 'Waiter' do
      visible do
        bindings[:controller]._current_user.role.name  == 'admin'
      end
    end
  end
  
end
