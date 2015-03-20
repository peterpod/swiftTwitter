import UIKit
import TwitterKit

class EmbeddedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Twitter.sharedInstance().logInGuestWithCompletion { (session: TWTRGuestSession!, error: NSError!) in
            Twitter.sharedInstance().APIClient.loadTweetWithID("20") { (tweet: TWTRTweet!, error: NSError!) in
                self.view.addSubview(TWTRTweetView(tweet: tweet))
            }
        }
    }
}
