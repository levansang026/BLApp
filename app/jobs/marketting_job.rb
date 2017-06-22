class MarkettingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Contact.where('id > 25').find_each do |contact|
      MarkettingMailer.launch_web(contact).deliver_later(wait: (5.minutes * contact.id))
    end
  end
end
