module XRoad
  class ActiveXRoad3
    def self.create_header(producer, user_id, service)
      id = UUIDTools::UUID.random_create.to_s
      id.delete! '-'
      {
        "xroad:id" => id,
        "xroad:service" => service,
        "xroad:consumer" => XRoad.configuration.consumer,
        "xroad:producer" => producer,
        "xroad:userId" => user_id
      }
    end

    def self.request(action, namespace, header, body)
      client = create_client(namespace)
      response = client.call(
        action,
        :soap_header => header,
        :message => body
      )
      response.body
    end

    def self.create_client(ns)
      config = XRoad.configuration
      Savon.client do
        endpoint config.host
        ssl_cert_file config.client_cert
        ssl_cert_key_file config.client_key
        pretty_print_xml true
        ssl_verify_mode config.ssl_verify
        log true
        log_level config.log_level
				convert_attributes_to proc { [] }
        namespace_identifier "prdcr"
        namespace ns
        namespaces(
          "xmlns:xroad" => "http://x-road.ee/xsd/x-road.xsd",
          "xmlns:prdcr" => ns
        )
      end
    end
  end
end
