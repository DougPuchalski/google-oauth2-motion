class RootController < UINavigationController
  def self.build(root)
    alloc.initWithRootViewController(root)
  end
end
