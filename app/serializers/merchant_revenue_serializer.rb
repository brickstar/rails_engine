class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    return "%.2f" % (object / 100.0) if object
    '0'
  end
end
