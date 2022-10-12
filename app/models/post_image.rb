class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpg')
    end
    image
  end

def destroy
  @post_image = PostImage.find(params[:id])
  @post_image.destroy
  redirect_to '/post_images'
end

end
