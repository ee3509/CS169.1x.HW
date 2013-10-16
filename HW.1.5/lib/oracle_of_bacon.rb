require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to

  def from_does_not_equal_to
   errors.add(:from, 'From == To') unless @from!=@to
  end
  
  def initialize(api_key='')
    @api_key = api_key
    
  end
  
  def from=value
    @from = value
    @to = "Kevin Bacon" if @to == nil    
  end
  
  def to=value
    @to = value
    @from = "Kevin Bacon" if @from == nil
  end

  def find_connections
    make_uri_from_arguments
    begin
      xml = URI.parse(uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e
      raise NetworkError.new(e.message)
    end
    # your code here: create the OracleOfBacon::Response object
    res = Response.new(xml)
  end

  def make_uri_from_arguments
    from = CGI.escape @from if @from != nil
    to = CGI.escape @to if @to !=nil
    api_key = CGI.escape @api_key if  @api_key != nil
    
    @uri = "http://oracleofbacon.org/cgi-bin/xml?p=#{api_key}&a=#{from}&b=#{to}"
  end
      
  class Response
    attr_reader :type, :data
    # create a Response object from a string of XML markup.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private

    def parse_response
      if ! @doc.xpath('/error').empty?
        parse_error_response
      elsif ! @doc.xpath('/spellcheck').empty?
        parse_spellcheck_response
      elsif ! @doc.xpath('/link').empty?
        parse_graph_response
      elsif ! @doc.xpath('/other').empty?
        parse_unknown_response
      end
    end
    
    def parse_unknown_response
      @type = :unknown
      @data = "unknown response type"
    end
    
    def parse_spellcheck_response
      @type = :spellcheck
      @data = @doc.xpath("//match")
      res = []
      @data.each do |elem|
        res << elem.text  
      end
      @data=res
      
    end
    def parse_graph_response
      @type = :graph
      @data = @doc.xpath("//actor | //movie")
      res = []
      @data.each do |elem|
        res << elem.text  
      end
      @data=res
    end
    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end
  end
end

# a = OracleOfBacon.new("38b99ce9ec87")
# a.to = "Denise Richards"
# res = a.find_connections
# puts res.type
# puts res.data

