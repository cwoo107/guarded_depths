class Webhook
  def receive
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end

    Webhook::Received.save(data: data, integration: params[:integration_name])

    render nothing: true
  end

  def initialize(ticket)
    @ticket = ticket
  end

  def process
    require 'nokogiri'
    require 'json'
    @ticket = Ticket.create!("ticket": @ticket, "code_id": Code.first)
  end
end