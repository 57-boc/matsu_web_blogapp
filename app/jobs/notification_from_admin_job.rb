class NotificationFromAdminJob <  ApplicationJob
  queue_as :default

  def perform(msg)
    # Jobを作成したら必ずperformを書く
    User.all.each do |user|
      NotificationFromAdminMailer.notify(user,msg).deliver_later
    end
  end
end