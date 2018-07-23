class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :set_invitation_code

  attr_accessor :recent

  private

  def set_invitation_code
    loop do
      self.invitation_code = SecureRandom.uuid
      break unless User.where(invitation_code: invitation_code).exists?
    end
  end
end
