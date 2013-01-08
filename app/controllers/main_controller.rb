class MainController < UIViewController

  def load_token
    @auth_proxy ||= begin
      auth_proxy = Google::AuthProxy.build("My google-oauth2-motion app")
      auth_proxy.configure do |config|
        # TODO fill in the client details and scope here
        config.client_id                  = '99999999999.apps.googleusercontent.com'
        config.client_secret              = 'aljsldkfjlskdjflksjdlfkjd'
        config.scope                      = 'https://www.googleapis.com/auth/plus.me' # Google+ API
      end
      auth_proxy.fetch_from_keychain
      auth_proxy
    end
  end

  def viewDidAppear(animated)
    super
    maybe_sign_in
  end

  def maybe_sign_in
    load_token
    @auth_proxy.maybe_refresh do
      if @auth_proxy.signed_in?
        puts "Already signed in"
      else
        auth_google(@auth_proxy)
      end
    end
  end

  def auth_google(auth_proxy)
    self.navigationController.pushViewController(GTMAuthController.build(auth_proxy), animated:true)
  end

end
