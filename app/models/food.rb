class Food < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :description, presence: true, length: { maximum: 100 }
  validate :image_required
  validate :unpermitted_extension

  private

  def image_required
    errors.add(:image, '画像を添付して下さい。') unless image.attached?
  end

  def unpermitted_extension
    if image.attached? && !permitted_extension?
      errors.add(:image, '画像以外は添付できません。')
    end
  end

  def permitted_extension?
    %w[image/jpg image/jpeg image/gif image/png].include?(image.blob.content_type) if image.attached?
  end
end
