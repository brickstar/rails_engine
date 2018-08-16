class MerchantDateSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    return "%.2f" % (object.total_revenue / 100.0) if object.total_revenue
    '0'
  end
end
