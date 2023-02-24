class Temperature < ApplicationRecord
  validates_uniqueness_of :fixed_at

  scope :current, -> { order(fixed_at: :desc).first }
  scope :history, -> { where(fixed_at: 1.days.ago..DateTime.now).order(fixed_at: :desc).all }
  scope :history_max, -> { where(fixed_at: 1.days.ago..DateTime.now).maximum(:value) }
  scope :history_min, -> { where(fixed_at: 1.days.ago..DateTime.now).minimum(:value) }
  scope :history_avg, -> { where(fixed_at: 1.days.ago..DateTime.now).average(:value) }
end
