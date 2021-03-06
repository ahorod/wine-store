class Order < ApplicationRecord
  belongs_to :account
  has_many :order_items

  before_save :update_total
  before_create :update_status

  scope :in_progress, -> (user) {where(:account_id => user.account.id, :status => 'In progress')}

  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  def item_number
    self.order_items.length
  end

  def decrease_stock
    self.order_items.each do |item|
      item.product.stock -= item.quantity
      item.product.save
    end
  end


  private

  def update_status
    if self.status == nil
      self.status = "In progress"
    end
  end


  def update_total
    self.total_price = calculate_total
  end

end
