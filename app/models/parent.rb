class Parent < ApplicationRecord
  has_many :children
  has_many :chores
  has_many :rewards
  mount_uploader :avatar, AvatarUploader
  
  def display_avatar
    if self.avatar.file.nil?
      set_default_avatar
    end
    ActionController::Base.helpers.image_tag self.avatar.url
  end
  
  def display_avatar_standard
    if self.avatar.file.nil?
      set_default_avatar
    end
    ActionController::Base.helpers.image_tag self.avatar.standard.url
  end
  
  def display_avatar_thumb
    if self.avatar.file.nil?
      set_default_avatar
    end
    ActionController::Base.helpers.image_tag self.avatar.thumb.url
  end
  
  def set_default_avatar
    img = LetterAvatar.generate(self.email, 200)
    File.open(img) do |f|
      self.avatar = f
    end          
    self.save
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
