class WebhookJob < ApplicationJob
  queue_as :default

  def perform(*body, id)
    ticket = Ticket.find(id)
    code = Code.find(ticket.code_id)
    require 'json'
    require 'httparty'
    if code.webhook.present?
      HTTParty.post(code.webhook,:body => body.to_json,:headers => { 'Content-Type' => 'application/json' } )
    end
  end
end