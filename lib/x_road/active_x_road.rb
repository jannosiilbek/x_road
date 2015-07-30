module XRoad
  class ActiveXRoad
    def self.create_header(producer, user_id, service)
      id = UUIDTools::UUID.random_create.to_s
      id.delete! '-'
      {
        "xtee:id" => id,
        "xtee:nimi" => service,
        "xtee:asutus" => XRoad.configuration.consumer,
        "xtee:andmekogu" => producer,
        "xtee:isikukood" => user_id
      }
    end

    def self.request(action, namespace, header, body)
      client = create_client(namespace)
      response = client.call(
        action,
        soap_header: header,
        message: body
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
        namespace_identifier "prdcr"
        namespace ns
        namespaces(
          "xmlns:xtee" => "http://x-tee.riik.ee/xsd/xtee.xsd",
          "xmlns:prdcr" => ns
        )
      end
    end
  end
end
