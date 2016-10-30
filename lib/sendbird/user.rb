module Sendbird
  class User < Base

    attribute :id, String
    attribute :user_id, String
    attribute :nickname, String
    attribute :access_token, String
    attribute :profile_url, String

    def create
      json = client.post("#{path}/create", params)

      self.class.new(json)
    end

    def list_messaging_channels
      params = {
        id: id
      }

      client.post("admin/list_messaging_channels", params)
    end

    def update
      params = {
        profile_url: profile_url
      }
      client.post("#{path}/#{id}", params)
    end

    def get
      params = {}
      client.get("#{path}/#{id}", params)
    end

    private

      def path
        "user"
      end

      def reference_id
        user_id
      end

      def params
        {
          id: id,
          nickname: nickname,
          profile_url: profile_url
        }
      end

  end
end
