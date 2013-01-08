class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @main = MainController.alloc.init
    @window.rootViewController = RootController.build(@main)
    @window.makeKeyAndVisible
    true
  end
end
