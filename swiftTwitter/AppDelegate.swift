
import UIKit
import Fabric
import TwitterKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Twitter()])
        
        // Check if the user is logged in or not to present the sign in screen.
        if Twitter.sharedInstance().session() != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signInViewController: AnyObject! = storyboard.instantiateViewControllerWithIdentifier("SignInViewController")
            self.window?.rootViewController = signInViewController as? UIViewController
            println("signed in as \(Twitter.sharedInstance().session().userName)");
        }
        else{
            println("user is singed in")
        }

        // Override point for customization after application launch.
        return true
    }


}

