class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :user_name, presence: true
         validates :user_profile, presence: true
         validates :user_affiliation, presence: true
         validates :user_position, presence: true
         has_many :prototypes
         has_many :comments, dependent: :destroy

         def name
          # name メソッドの実装（例: user_name フィールドを返す）
          user_name
        end
end
