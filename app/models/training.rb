class Training < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :user

  validates :user_id, presence: true

  validates :date, presence: true
  validates :training_detail, presence: true

  validates_numericality_of :running_distance

end
