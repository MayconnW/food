require Rails.root.join('lib', 'rails_admin', 'open_table_sale.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::OpenTableSale)

RailsAdmin.config do |config|
  
  config.model 'Rich' do
    visible false
  end
  
  config.included_models = ["City", "State", "User", "Customer", "Category", "Product", "Sale", "Item", "Waiter"]
  
  
  require 'i18n'
  I18n.default_locale = 'en'

  ### Popular gems integration

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard do
      statistics true
    end
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    open_table_sale
 
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  config.authenticate_with do
    warden.authenticate! scope: :user
    if current_user.role.name != 'admin' && current_user.role.name != 'cashier'
      redirect_to main_app.signout_path
    end
  end
  
  config.authorize_with :cancan
  
  #config.authorize_with do
  #  redirect_to main_app.signout_path unless (current_user.role.name == 'admin' || current_user.role.name == 'call_agent')
  #end
  
  config.current_user_method(&:current_user)
  
  config.main_app_name = Proc.new { |controller| [ "Eventos", "#{controller.params[:action].try(:titleize)}" ] }
  
end
