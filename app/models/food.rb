class Food < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :description, presence: true, length: { maximum: 100 }
  validate :image_required

  private

  def image_required
    errors.add(:image, '画像を添付して下さい。') unless image.attached?
  end
end
