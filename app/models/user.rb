class User < ApplicationRecord
  before_save :downcase_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 	validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email.downcase!
    end

end
