class User < ActiveRecord::Base

  validates :user_email, :hashword, :session_id, presence: true
  validates :user_email, uniqueness: true
  validates :password, length: {minimum: 1, allow_nil: true}

  after_initialize :set_session

  attr_reader :password

  def self.find_by_creds(email, pword)

    @user = User.find_by_user_email(email)
    return nil if @user.nil?
    return @user if BCrypt::Password.new(@user.hashword).is_password?(pword)

    nil
  end


  def password=(password)
    @password = password
    self.hashword = BCrypt::Password.create(password)
  end

  def set_session
    self.session_id = SecureRandom.urlsafe_base64(32)
  end

  def reset_session!
    self.session_id = SecureRandom.urlsafe_base64(32)
    self.save!
    self.session_id
  end

end
