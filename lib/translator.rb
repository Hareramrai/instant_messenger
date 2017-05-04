require 'rest-client'
class Translator 

  def initialize url=nil
    @url = url || "http://www.degraeve.com/cgi-bin/"
    @client = RestClient::Resource.new @url, headers: { accept: :json }
  end

  def translate dialect, message
    response = @client["/babel.cgi?d=#{dialect.code}&w=#{message}"].get
    parse_html response
  end 

  private
  def parse_html response
    html_data =  Nokogiri::HTML(response)
    html_data.at_css("p").text.strip
  end
end
