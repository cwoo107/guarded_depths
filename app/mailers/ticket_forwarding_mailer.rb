class TicketForwardingMailer < ApplicationMailer

  def forwarding_ticket(ticket_id)
    @ticket = Ticket.find(ticket_id)
    @code = Code.find(@ticket.code_id)
    if @code.forward_address.present?
      @printable_text = @ticket.ticket['NewDataSet']['tickets']['printable_text']
      mail(to: @code.forward_address, subject: "Forwarded ticket: #{@ticket.ticket['NewDataSet']['tickets']['ticket']}-#{@ticket.ticket['NewDataSet']['tickets']['revision']}")
      @ticket.update!(email_sent: true)
    end
  end
end