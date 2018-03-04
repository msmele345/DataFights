class HistoricalQuote < ApplicationRecord
  belongs_to :stock, optional: true

  # validates :stock_id, uniqueness: true

end
