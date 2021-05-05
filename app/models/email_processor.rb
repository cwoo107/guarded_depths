class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    require 'nokogiri'
    require 'json'

    doc = File.open(@email.attachments[0]) { |f| Nokogiri::XML(f) }

    xml_ticket = doc.at('NewDataSet').to_xml

    json_ticket = Hash.from_xml(xml_ticket).to_json

    @ticket = JSON.parse(json_ticket)

    if @ticket['NewDataSet']['audit'].nil?
      code_lookup = @ticket['NewDataSet']['delivery']['recipient']

      @code = Code.find_by_code(code_lookup)

      #if @code.webhook.present?
      #  WebhookJob.perform_later(@ticket, @code.webhook)
      #end

      @ticket = Ticket.create!("ticket_json": @ticket, "code_id": @code.id)

    end

  end
end