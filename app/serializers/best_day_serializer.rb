class BestDaySerializer < ActiveModel::Serializer
  attributes :best_day

  def best_day
    object.updated_at
  end
end
