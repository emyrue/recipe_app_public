class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :recipes, dependent: :delete_all
  validates :username, presence: true, uniqueness: true
  validates :code, acceptance: { accept: [ENV['SECRET_CODE']], message: 'Invalid code' }
  
  def admin?
    user_type == 'admin'
  end
end
