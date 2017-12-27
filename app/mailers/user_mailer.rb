class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("subject_account")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("subject_pass")
  end
end
