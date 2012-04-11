class Request
  module Payload
    module Github
      class GenericEvent
        attr_accessor :payload, :data, :token

        def initialize(payload, token)
          @payload, @token = payload, token
          @data = ActiveSupport::JSON.decode(payload)
        end

        def attributes
          {
            :source     => 'github',
            :payload    => payload,
            :commit     => commit,
            :token      => token,
            :repository => repository
          }
        end

        def commit
          event.commit
        end

        def repository
          event.repository
        end

        def accept?
          true
        end
      end
    end
  end
end