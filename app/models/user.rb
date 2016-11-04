class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :role
  belongs_to :state
  belongs_to :city
  before_create :set_default_role
  
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
  
  #Se quiser alterar o campo de visualização pode se usar o comando
  #config.label_methods.unshift(:display_name)
  #em seguida criar a função com o nome sugerido
  
  private
  def set_default_role
    self.role ||= Role.find_by_name('admin')
  end
  
  RailsAdmin.config do |config|
    config.model 'User' do
      list do
        field :id
        field :email
        field :role
      end
      edit do
        field :email
        field :password
        field :password_confirmation
        field :role
        
        field :name
        field :photo
      end
    end
  end
  
end
