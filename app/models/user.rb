class User < ApplicationRecord
  before_save :downcase_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 	validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  has_many :friendships, class_name: "Friendship", foreign_key: "user_id"
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :active_friends, -> { where(friendships: { accepted: true }) }, through: :friendships, source: :friend
  has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { accepted: false }) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

  def friends
     active_friends | received_friends
  end

  def pending
    pending | requested_friendships
  end

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email.downcase!
    end

end
