class TicketForwardingMailer < ApplicationMailer

  def forwarding_ticket(ticket_id, recipient)
    @ticket = Ticket.find(ticket_id)
    @recipient = recipient
    @printable_text = @ticket.ticket_json['NewDataSet']['tickets']['printable_text']
    mail(to: @recipient, subject: "Forwarded ticket: #{@ticket.ticket_json['NewDataSet']['tickets']['ticket']}-#{@ticket.ticket_json['NewDataSet']['tickets']['revision']}")
  end

end