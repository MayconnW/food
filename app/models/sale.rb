class Sale < ActiveRecord::Base
  belongs_to :customer
  belongs_to :waiter
  has_many :items, :dependent => :destroy, :inverse_of => :sale
  
  validates :waiter, :presence => true
  validate :unique_table_open
  
  def unique_table_open
    if self.id > 0
      
    else
      unique_open = Sale.where(table: self.table).where(status: 0).empty?
      errors.add(:table, "This table is already open.") unless unique_open
    end
  end
  
  accepts_nested_attributes_for :items, :allow_destroy => true
  
  
  #scope :cashier, lambda { |teste| teste.name == 'cashier' ? where(:status => 0 ) : where(:status => 1 )}
  #scope :cashier, ->(teste) { where(status: 1) }
  
  #def teste
  #  1
  #end
  
  def status_enum
    { open: 0, closed: 1 }
  end
  
  after_initialize do
    if new_record?
      self.status ||= 0 
    end
  end
  
  def total_amount
    result = 0
    self.items.each do |item|
      result += item.product.price * item.quantity
    end
    "$%.2f" % result
  end
  
  #number_format :balance, 
  #              :precision => 2,
  #              :delimiter => ',',
  #              :strip_trailing_zeros => false
  #scopes [:cashier]
  
  RailsAdmin.config do |config|
    config.model 'Sale' do
      list do
        sort_by 'status ASC, sales.table ASC, sales.id'
        field :table
        field :customer
        field :waiter
        field :status, :enum do
          :status_enum
          sort_reverse false
        end
        field :total_amount
      end
      edit do 
        field :table
        field :customer
        field :waiter
        field :items, :simple_has_many do
          help 'Selecione os itens do pedido'
          orderable false
          required true
        end
      end
    end
  end

end
