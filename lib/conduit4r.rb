require 'httparty'

class Conduit4R#:nodoc:
  include HTTParty
    
  # # API returned 401 Unauthorized
  # class UnauthorizedException < Exception
  # end
  # 
  # # API could not find record
  # class RecordNotFound < Exception
  # end
  
  def initialize(host, user, pass)
    self.class.base_uri host
    self.class.basic_auth user, pass
    self.class.format :json
  end

  # Get vulnerabilities
  #
  # == Parameters
  # * <tt>:per_page</tt> -- OPTIONAL, how many results to return per page
  # * <tt>:start_index</tt> -- OPTIONAL, the index of the result to start with. If :per_page = 10, setting :start_index = 10 will
  # give you the second page of results, :start_index = 20 will give you the third page of results, etc.
  def vulnerabilities(query = {})
    self.class.get("/vulnerabilities.json", :query => query)
  end

  # Get assets
  #
  # == Parameters
  # * <tt>:per_page</tt> -- OPTIONAL, how many results to return per page
  # * <tt>:start_index</tt> -- OPTIONAL, the index of the result to start with. If :per_page = 10, setting :start_index = 10 will
  # give you the second page of results, :start_index = 20 will give you the third page of results, etc.
  def assets(query = {})
    self.class.get("/assets.json", :query => query)
  end

  # def self.available?
  #   response = get("/test.json", :query => nil)
  #   (!response.nil? && response["response"] == "ok") ? true : false
  # end
end