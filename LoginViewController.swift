import UIKit
import TwitterKit

class LoginViewController: UIViewController, UIAlertViewDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var signInTwitterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Decorate the Sign In with Twitter and Phone buttons.
        decorateButton(signInTwitterButton, color: UIColor(red: 0.333, green: 0.675, blue: 0.933, alpha: 1))
    }
    
    // Navigate to Twitter Table view
    private func navigateToMainAppScreen() {
        self.performSegueWithIdentifier("ShowTweetTable", sender: self)
    }
    
    // IBActions
    @IBAction func signInWithTwitter(sender: UIButton) {
        Twitter.sharedInstance().logInWithCompletion { (session: TWTRSession!, error: NSError!) -> Void in
            if session != nil {
                self.navigateToMainAppScreen()
            }
        }
    }
    
    
    // Decorate Signin button
    private func decorateButton(button: UIButton, color: UIColor) {
        // Draw the border around a button.
        button.layer.masksToBounds = false
        button.layer.borderColor = color.CGColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 6
    }
    
}
