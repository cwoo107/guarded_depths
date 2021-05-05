class WebhookJob < ApplicationJob
  queue_as :default

  def perform(*body, url)
    require 'json'
    require 'httparty'
    HTTParty.post(url,:body => body.to_json,:headers => { 'Content-Type' => 'application/json' } )
  end
end