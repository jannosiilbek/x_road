module XRoad
  module Kpr
    class LaekumineMaksuametist < XRoad::ActiveXRoad
      def self.find(identity_code)
        header = create_header(
          'kpr', identity_code, 'kpr.laekumised_maksuametist.v1'
        )
        body = create_body(identity_code)
        request(
          "laekumised_maksuametist",
          "http://producers.kpr.xtee.riik.ee/producer/kpr",
          header,
          body
        )
      end

      def to_json
      end

      private
      def self.create_body(identity_code)
        {
          "keha": {
            "ISIKUKOOD" => identity_code
          }
        }
      end
    end
  end
end
