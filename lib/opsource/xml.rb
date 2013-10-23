module Opsource
  module XML
    def xml_header
      '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' "\n"
    end

    def parse_response_xml_body(body)
      # we'll not use 'KeyToSymbol' because it doesn't symbolize the keys for node attributes
      opts = { 'ForceArray' => false, 'ForceContent' => false }
      hash = XmlSimple.xml_in(body, opts)
      hash.delete_if {|k, v| k =~ /(xmlns|xmlns:ns)/ } # removing the namespaces from response
      Hashie::Mash.new(underscore_keys(hash))
    rescue Exception => e
      log "Impossible to convert XML to hash. Error: #{e.message}", :red
      raise e
    end

    def build_request_xml_body(schema, tag, params)
      params = camelize_keys(params)
      schema_url = "http://oec.api.opsource.net/schemas/#{schema}"

      xml = xml_header
      xml += "<#{tag} xmlns=\"#{schema_url}\">\n"
      params.each do |k, value|
        xml += "<#{k}>#{value}</#{k}>\n"
      end
      xml += "</#{tag}>\n"
    end
  end
end

    # def network_natrule_create_request_xml(params)
    #   xml = xml_header
    #   xml += '<NatRule xmlns="http://oec.api.opsource.net/schemas/network">'
    #   xml += "<name>#{params[:name]}</name> <sourceIp>#{params[:sourceIp]}</sourceIp>"
    #   xml += "</NatRule>"
    #   xml
    # end