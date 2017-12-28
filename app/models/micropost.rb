class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.micro.max_length}
  validate  :picture_size
  scope :created_at_desc, ->{order created_at: :desc}
  mount_uploader :picture, PictureUploader

  private

  def picture_size
    return unless picture.size > Settings.micro.size_image.megabytes
    errors.add :picture, t("size_image")
  end
end
