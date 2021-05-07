class Ticket < ApplicationRecord
  after_create_commit :send_ticket
  belongs_to :code

  def send_ticket
    WebhookJob.perform_later(ticket, id)
    TicketForwardingMailer.forwarding_ticket(id).deliver_later
  end
end
