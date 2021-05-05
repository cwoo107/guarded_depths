class TicketForwardingMailer < ApplicationMailer

  def initialize(ticket, recipient, printable_text)
    @ticket = ticket
    @recipient = recipient
    @printable_text = printable_text
  end

  def forwarding_ticket
    mail(to: @recipient, subject: "Forwarded ticket: #{@ticket}")
  end

end