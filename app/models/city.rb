class City < ActiveRecord::Base
  belongs_to :state
  
  RailsAdmin.config do |config|
    config.model 'City' do
      visible false
    end
  end
  
  def city_params
    params.require(:city).permit(:name)
  end
end
