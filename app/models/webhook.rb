class Webhook
  def initialize(ticket)
    @ticket = ticket
  end

  def process
    require 'nokogiri'
    require 'json'
    @ticket = Ticket.create!("ticket": @ticket, "code_id": Code.first)
  end
end