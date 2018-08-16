class Ingredient < ApplicationRecord
  has_many :doses
  before_destroy :check_for_doses

  validates :name, uniqueness: true, presence: true

  private

  def check_for_doses
    raise ActiveRecord::InvalidForeignKey if doses.count > 0
  end
end
