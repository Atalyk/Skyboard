import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var webView: UIWebView!
    var installButton: UIButton!
    var playButton: UIButton!
    var layerView: UIView!
    var imageView: UIImageView!
    var visualEffectView: UIVisualEffectView!
    var titleLabel: UILabel!
    var quoteLabel: UILabel!
    var textView: UITextView!
    
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
    }
    
    func playTutorial() {
 
        let moviePath = NSBundle.mainBundle().pathForResource("normal", ofType: "mp4")
        let fileURL = NSURL(fileURLWithPath: moviePath!)
        
        playerView = AVPlayer(URL: fileURL)
        
        playerViewController.player = playerView
        
        self.presentViewController(playerViewController, animated: true) {
            self.playerViewController.player?.play()
        }
    }
    
    func openSettings() {
        if let settingsURL = NSURL(string: "prefs:root=General&path=Keyboard") {
            UIApplication.sharedApplication().openURL(settingsURL)
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    func setup() {
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height
        
        imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight))
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .ScaleAspectFill
        self.view.addSubview(imageView)
        
        visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        visualEffectView.frame = imageView.bounds
        imageView.addSubview(visualEffectView)
        
        if UIScreen.mainScreen().bounds.width > UIScreen.mainScreen().bounds.height {
            playButton = UIButton(frame: CGRect(x: screenWidth * 0.2, y: screenHeight * 0.5, width: screenWidth*0.6, height: 50))
            playButton.layer.backgroundColor = UIColor(red: 78/255, green: 168/255, blue: 247/255, alpha: 1.0).CGColor
            playButton.setTitle("Guide", forState: .Normal)
            playButton.titleLabel?.font = UIFont(name: "AmaticSC-Regular", size: screenWidth * 0.05)
            playButton.layer.cornerRadius = 5
            playButton.addTarget(self, action: #selector(playTutorial), forControlEvents: .TouchUpInside)
            self.view.addSubview(playButton)
            
            titleLabel = UILabel(frame: CGRect(x: screenWidth * 0.2, y: screenHeight * 0.1, width: screenWidth * 0.6, height: screenHeight * 0.3))
            titleLabel.text = "Skyboard"
            titleLabel.textColor = UIColor.whiteColor()
            titleLabel.textAlignment = .Center
            titleLabel.font = UIFont(name: "AmaticSC-Regular", size: screenWidth * 0.1)
            self.view.addSubview(titleLabel)
            
            quoteLabel = UILabel(frame: CGRect(x: screenWidth * 0.2, y: screenHeight * 0.25, width: screenWidth * 0.6, height: screenHeight * 0.3))
            quoteLabel.text = "∼ for easy typing ∼"
            quoteLabel.textColor = UIColor.whiteColor()
            quoteLabel.textAlignment = .Center
            quoteLabel.font = UIFont(name: "AmaticSC-Regular", size: screenWidth * 0.06)
            self.view.addSubview(quoteLabel)
            
            textView = UITextView(frame: CGRect(x: screenWidth * 0.2, y: screenHeight * 0.65, width: screenWidth * 0.6, height: screenHeight * 0.3))
            textView.text = "Go to Settings > General > Keyboards > Add New Keyboard > Skyboard > Allow Full Access"
            textView.editable = false
            textView.textColor = UIColor.whiteColor()
            textView.layer.backgroundColor = UIColor.clearColor().CGColor
            textView.textAlignment = .Center
            textView.font = UIFont(name: "AmaticSC-Regular", size: screenWidth * 0.03)
            self.view.addSubview(textView)
            
        } else {
            playButton = UIButton(frame: CGRect(x: screenWidth * 0.2, y: screenHeight * 0.5, width: screenWidth*0.6, height: 50))
            playButton.layer.backgroundColor = UIColor(red: 78/255, green: 168/255, blue: 247/255, alpha: 1.0).CGColor
            playButton.setTitle("Guide", forState: .Normal)
            playButton.titleLabel?.font = UIFont(name: "AmaticSC-Regular", size: screenWidth * 0.07)
            playButton.layer.cornerRadius = 5
            playButton.addTarget(self, action: #selector(playTutorial), forControlEvents: .TouchUpInside)
            self.view.addSubview(playButton)
            
            titleLabel = UILabel(frame: CGRect(x: screenWidth * 0.2, y: screenHeight * 0.25, width: screenWidth * 0.6, height: screenHeight * 0.1))
            titleLabel.text = "Skyboard"
            titleLabel.textColor = UIColor.whiteColor()
            titleLabel.textAlignment = .Center
            titleLabel.font = UIFont(name: "AmaticSC-Regular", size: screenWidth * 0.17)
            self.view.addSubview(titleLabel)
            
            quoteLabel = UILabel(frame: CGRect(x: screenWidth * 0.2, y: screenHeight * 0.37, width: screenWidth * 0.6, height: screenHeight * 0.1))
            quoteLabel.text = "∼ for easy typing ∼"
            quoteLabel.textColor = UIColor.whiteColor()
            quoteLabel.textAlignment = .Center
            quoteLabel.font = UIFont(name: "AmaticSC-Regular", size: screenWidth * 0.1)
            self.view.addSubview(quoteLabel)
            
            textView = UITextView(frame: CGRect(x: screenWidth * 0.2, y: screenHeight * 0.6, width: screenWidth * 0.6, height: screenHeight * 0.3))
            textView.text = "Go to Settings > General > Keyboards > Add New Keyboard > Skyboard > Allow Full Access"
            textView.editable = false
            textView.textColor = UIColor.whiteColor()
            textView.layer.backgroundColor = UIColor.clearColor().CGColor
            textView.textAlignment = .Center
            textView.font = UIFont(name: "AmaticSC-Regular", size: screenWidth * 0.07)
            self.view.addSubview(textView)
            
        }
        
        
    }
    
}

