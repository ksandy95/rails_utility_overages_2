class Expense < ApplicationRecord
  
  validates_presence_of :period_posted,
                        :account_name,
                        :net,
                        :invoice_number,
                        :unit_id,
                        :vendor_id
end
