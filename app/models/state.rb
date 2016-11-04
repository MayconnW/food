class State < ActiveRecord::Base
  
  has_many :cities
  belongs_to :capital, :class_name => 'City'
  
  RailsAdmin.config do |config|
    config.model 'State' do
      visible false
    end
  end

  def state_params
    params.require(:state).permit(:name, :initial, :capital)
  end
end
