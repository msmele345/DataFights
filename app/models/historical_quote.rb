class HistoricalQuote < ApplicationRecord
  belongs_to :stock, optional: true
end
