module Google
  class AuthProxy

    # @attr id [String] Login/email or similar to distinguish multiple credentials
    # @attr auth [GTMOAuth2Authentication]

    attr_reader :auth

    def self.build(name, auth = nil)
      inst = allocate.instance_eval do
        @name = name
        @auth = auth
        self
      end
      inst
    end

    class Config < Struct.new(:client_id, :client_secret, :scope); end

    attr_reader :config

    def configure(&block)
      @config = Config.new
      block.call(@config)
      self
    end

    def self.singleton
      @singleton ||= build(:singleton)
    end

    def auth=(value)
      @auth = value
    end

    def signed_in?
      !!access_token
    end

    def sign_out
      GTMOAuth2ViewControllerTouch.revokeTokenForGoogleAuthentication(@auth)
      remove_from_keychain
    end

    def access_token
      @auth ? @auth.accessToken : nil
    end

    def refresh(&block)
      return unless @auth
      @auth.authorizeRequest(nil, completionHandler: ->(error) { block.call(error) if block })
    end

    def maybe_refresh(&block)
      if access_token
        false
      else
        refresh(&block)
        true
      end
    end

    def email_address
      @auth ? @auth.userEmail : nil
    end

    def expires_at
      @auth ? @auth.expirationDate : nil
    end

    def keychain_item_name
      @name
    end

    def remove_from_keychain
      GTMOAuth2ViewControllerTouch.removeAuthFromKeychainForName(keychain_item_name)
    end

    def fetch_from_keychain
      @auth = GTMOAuth2ViewControllerTouch.authForGoogleFromKeychainForName(keychain_item_name,
        clientID:config.client_id, clientSecret:config.client_secret)
      self
    end

  end
end
