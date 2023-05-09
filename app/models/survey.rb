class Survey < ApplicationRecord
  REASONS = %w[expensive not_interested_anymore difficult_to_use other].freeze

  belongs_to :user

  validates :competitor_url, presence: true, format: { with: /\A^(http|https)\z/i }
  validates :reason, presence: true
  validate :reason_in_list
  validate :description_required_if_other

  private

  def reason_in_list
    errors.add(:reason, "not in list") if REASONS.exclude?(reason)
  end

  def description_required_if_other
    if reason == "other" && description.blank?
      errors.add(:description, "cannot be blank")
    end
  end
end
