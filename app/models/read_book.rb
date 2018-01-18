class ReadBook < ApplicationRecord
  belongs_to :book

  # def year_read
  #   created_at.year
  # end

  before_save :set_read_date

  def set_read_date
    self.read_date = Date.current
  end
end
