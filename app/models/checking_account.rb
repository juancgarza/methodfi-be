class CheckingAccount < ApplicationRecord
  has_one :address
  belongs_to :account
end
