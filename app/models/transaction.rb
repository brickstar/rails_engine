class Transaction < ApplicationRecord
  belongs_to :invoice

  enum result: [:failed, :success]

  default_scope -> { order(id: :asc) }
  
  scope :success, -> { where(result: 1) }
end
