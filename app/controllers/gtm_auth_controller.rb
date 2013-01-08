# http://code.google.com/p/gtm-oauth2/wiki/Introduction

class GTMAuthController < GTMOAuth2ViewControllerTouch

  def self.build(auth_proxy)
    allocate.instance_eval do
      @auth_proxy = auth_proxy
      initWithScope(auth_proxy.config.scope, clientID:auth_proxy.config.client_id,
          clientSecret:auth_proxy.config.client_secret, keychainItemName:auth_proxy.keychain_item_name,
          delegate:self, finishedSelector:'viewController:finishedWithAuth:error:')
      self
    end
  end

  def viewController(viewController, finishedWithAuth:auth, error:error)
    if error
      # KGTMOAuthErrorWindowClosed means user closed before completion
      puts error[0].localizedDescription
      raise error[0].localizedDescription
    else
      @auth_proxy.auth = auth

      puts "Authentication successful: #{auth.inspect}"
      puts "Access token: #{auth.accessToken}"
      puts "Refresh token: #{auth.refreshToken}"
      puts "Expires: #{auth.expiresIn}"
      puts "userEmail: #{auth.userEmail}"
      puts "userID: #{auth.userID}"
    end
  end

end
