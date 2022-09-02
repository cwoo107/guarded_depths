class GetCodes

  def initialize(id, billing_code, user_id)
    @company = id
    @billing_code = billing_code
    @user = user_id
  end

  def get
    require 'net/http'
    uri = URI("http://UsanPull1API.usanorth811.org/members?group_code=#{@billing_code}")
    codes = Net::HTTP.get(uri)
    codes = JSON.parse(codes)
    codes['data'].each do |code|
      Code.create(company_id: @company, user_id: @user, code: code['attributes']['code'], newtin_code: code['attributes']['member_id'].to_s)
    end
  end
end