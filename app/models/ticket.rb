class Ticket < ApplicationRecord

  after_create_commit :send_ticket

  after_create_commit { broadcast_prepend_to "tickets" }
  after_update_commit { broadcast_replace_to "tickets" }
  after_destroy_commit { broadcast_remove_to "tickets" }

  belongs_to :code

  def send_ticket
    WebhookJob.perform_later(ticket, id)
    TicketForwardingMailer.forwarding_ticket(id).deliver_later
  end
end
