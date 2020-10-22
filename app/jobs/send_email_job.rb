class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(model)
    all_emails = (model.event.subscriptions.map(&:user_email) + [model.event.user.email] - [model.user&.email]).uniq

    if model == Comment
      all_emails.each { |mail| EventMailer.comment(model.event, model, mail).deliver_later }
    elsif model == Photo
      all_emails.each { |mail|  EventMailer.photo(model.event, model, mail).deliver_later }
    end
  end
end
