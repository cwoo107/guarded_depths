class TicketForwardingMailer < ApplicationMailer

  def forwarding_ticket(ticket_id, recipient)
    @ticket = Ticket.find(ticket_id)
    @recipient = recipient
    @printable_text = @ticket.ticket['NewDataSet']['tickets']['printable_text']
    mail(to: @recipient, subject: "Forwarded ticket: #{@ticket.ticket['NewDataSet']['tickets']['ticket']}-#{@ticket.ticket['NewDataSet']['tickets']['revision']}")
  end

end