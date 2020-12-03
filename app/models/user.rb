class User < ApplicationRecord

  has_secure_password

  def designer?
    self.privilege > 0 && self.privilege < 4
  end

  def accepted_designer?
    self.privilege == 2
  end

  def accepted_designer_or_admin?
    self.privilege == 2 || self.privilege == 4
  end

  def admin?
    self.privilege == 4
  end

end
