class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role
  has_many :surveys
  #assigns default role to member
  def assign_default_role
    add_role(:member) if self.roles.blank?
  end

end
