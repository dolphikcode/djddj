class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin, :editor], multiple: false)                                      ##
  ############################################################################################


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable:registerable,
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  validates_presence_of :name

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  def creat_usr
    guest = User.new
    guest.name = "AAAGuest User"
    guest.email = "a@example.com"
    guest.password = "ABCkosmos"
    guest.save
  end
end
