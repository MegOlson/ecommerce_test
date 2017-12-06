class Order < ActiveRecord::Base
  belongs_to :account
  has_many :order_items
  before_save :update_total
  before_create :update_status
  scope :in_progress, -> (user) {where(account_id: user.account.id, status: 'In progress')}

  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end


  private

  def update_status
    if !self.status
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end
end
