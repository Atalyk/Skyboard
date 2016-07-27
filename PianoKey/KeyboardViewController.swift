//
//  KeyboardViewController.swift
//  PianoKey
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import UIKit
import AVFoundation

var extraButtonHeight = UIScreen.mainScreen().bounds.width * 0.08
var globals = Globals()

class KeyboardViewController: UIInputViewController {
    
    var leftView = LeftKeyboardView(frame: CGRectZero)
    var rightView = RightKeyboardView(frame: CGRectZero)
    var defaultView = DefaultKeyboardView(frame: CGRectZero)
    var landView = LandKeyboardView(frame: CGRectZero)

    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    
    var copyButton: UIButton!
    var cutButton: UIButton!
    var pasteButton: UIButton!
    var defaultButton: UIButton!
    var undoButton: UIButton!
    
    var lineViewOne: UIView!
    var lineViewTwo: UIView!
    
    var timer: NSTimer?

    var currentButtonView: UIView!
    
    var longPressRecognizer = UILongPressGestureRecognizer()
    
    var saveText = ""
    var undoArray = [String]()
    
    var undoIndex = 0
    
    override func loadView() {
        
        longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(KeyboardViewController.longPressHandler(_:)))
        
        defaultView.textDocumentaryProxy = (textDocumentProxy as UITextDocumentProxy)
        defaultView.nextKeyboardButton.button.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        defaultView.eraseButton.button.addTarget(self, action: #selector(KeyboardViewController.deleteText), forControlEvents: .TouchUpInside)
        
        landView.textDocumentaryProxy = (textDocumentProxy as UITextDocumentProxy)
        landView.nextLandKeyboardButton.button.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        landView.eraseButton.button.addTarget(self, action: #selector(KeyboardViewController.deleteText), forControlEvents: .TouchUpInside)
        
        if UIScreen.mainScreen().bounds.width > UIScreen.mainScreen().bounds.height {
            landView.eraseButton.button.addGestureRecognizer(longPressRecognizer)
            self.view = landView
            extraButtonHeight = UIScreen.mainScreen().bounds.width * 0.01
        } else {
            defaultView.eraseButton.button.addGestureRecognizer(longPressRecognizer)
            self.view = defaultView
            extraButtonHeight = UIScreen.mainScreen().bounds.width * 0.08
        }
        
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        

    }
    
    override func  viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator){
        
        print("test")
        
        defaultView = DefaultKeyboardView(frame: CGRectZero)
        defaultView.textDocumentaryProxy = (textDocumentProxy as UITextDocumentProxy)
        defaultView.nextKeyboardButton.button.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        defaultView.eraseButton.button.addTarget(self, action: #selector(KeyboardViewController.deleteText), forControlEvents: .TouchUpInside)
        defaultView.eraseButton.button.addGestureRecognizer(longPressRecognizer)
        
        landView = LandKeyboardView(frame: CGRectZero)
        landView.textDocumentaryProxy = (textDocumentProxy as UITextDocumentProxy)
        landView.nextLandKeyboardButton.button.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        landView.eraseButton.button.addTarget(self, action: #selector(KeyboardViewController.deleteText), forControlEvents: .TouchUpInside)
        landView.eraseButton.button.addGestureRecognizer(longPressRecognizer)
        
        if UIScreen.mainScreen().bounds.width > UIScreen.mainScreen().bounds.height {
            globals.tapped -= 1
            landView.changeLetterCase()
            self.view = landView
            extraButtonHeight = UIScreen.mainScreen().bounds.width * 0.04
        } else {
            globals.tapped -= 1
            defaultView.changeLetterCase()
            self.view = defaultView
            extraButtonHeight = UIScreen.mainScreen().bounds.width * 0.08
        }
        
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressClearText = UILongPressGestureRecognizer(target: self, action: #selector(clearText))
        self.view.addGestureRecognizer(longPressClearText)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(KeyboardViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(KeyboardViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(KeyboardViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)

        setup()
    }
    
    override func viewDidAppear(animated: Bool) {
        let background  = CAGradientLayer().primaryColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    }
    
    override func viewDidDisappear(animated: Bool) {
        view.subviews.forEach { $0.removeFromSuperview() }
    }

    
    func setup() {
        
        screenWidth = UIScreen.mainScreen().bounds.width
        screenHeight = UIScreen.mainScreen().bounds.height
        
        if UIScreen.mainScreen().bounds.width > UIScreen.mainScreen().bounds.height {
            extraButtonHeight = UIScreen.mainScreen().bounds.width * 0.04
        } else {
            extraButtonHeight = UIScreen.mainScreen().bounds.width * 0.08
        }
        
        let background  = CAGradientLayer().primaryColor()
        background.frame = CGRectMake(0.0, 0.0, screenWidth, screenHeight)
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        undoButton = UIButton(frame: CGRect(x: 0.0, y: 5, width: screenWidth * 0.2, height: extraButtonHeight))
        //undoButton.setTitle("⌘Z", forState: .Normal)
        undoButton.contentMode = .Center
        undoButton.addTarget(self, action: #selector(KeyboardViewController.undoText), forControlEvents: .TouchUpInside)
        undoButton.setImage(UIImage(named: "undopic"), forState: .Normal)
        undoButton.contentMode = .Center
        undoButton.imageView?.contentMode = .ScaleAspectFit
        self.view.addSubview(undoButton)
        
        cutButton = UIButton(frame: CGRect(x: screenWidth * 0.2, y: 5, width: screenWidth * 0.2, height: extraButtonHeight))
        //cutButton.setTitle("⌘X", forState: .Normal)
        cutButton.setImage(UIImage(named: "cut"), forState: .Normal)
        cutButton.contentMode = .Center
        cutButton.addTarget(self, action: #selector(KeyboardViewController.cutText), forControlEvents: .TouchUpInside)
        cutButton.imageView?.contentMode = .ScaleAspectFit
        self.view.addSubview(cutButton)
        
        copyButton = UIButton(frame: CGRect(x: screenWidth * 0.6, y: 5, width: screenWidth * 0.2, height: extraButtonHeight))
        //copyButton.setTitle("⌘C", forState: .Normal)
        copyButton.setImage(UIImage(named: "copyit"), forState: .Normal)
        copyButton.contentMode = .Center
        copyButton.addTarget(self, action: #selector(KeyboardViewController.copyText), forControlEvents: .TouchUpInside)
        copyButton.imageView?.contentMode = .ScaleAspectFit
        self.view.addSubview(copyButton)
        
        defaultButton = UIButton(frame: CGRect(x: screenWidth * 0.4, y: 5, width: screenWidth * 0.2, height: extraButtonHeight))
        defaultButton.setImage(UIImage(named: "keyboards"), forState: .Normal)
        defaultButton.contentMode = .Center
        defaultButton.addTarget(self, action: #selector(KeyboardViewController.defaultKeyboard), forControlEvents: .TouchUpInside)
        defaultButton.imageView?.contentMode = .ScaleAspectFit
        self.view.addSubview(defaultButton)
        
        pasteButton = UIButton(frame: CGRect(x: screenWidth * 0.8, y: 5, width: screenWidth * 0.2, height: extraButtonHeight))
        //pasteButton.setTitle("⌘V", forState: .Normal)
        pasteButton.setImage(UIImage(named: "paste"), forState: .Normal)
        pasteButton.contentMode = .Center
        pasteButton.addTarget(self, action: #selector(KeyboardViewController.pasteText), forControlEvents: .TouchUpInside)
        pasteButton.imageView?.contentMode = .ScaleAspectFit
        self.view.addSubview(pasteButton)
        
        currentButtonView = UIView(frame: CGRect(x: defaultButton.frame.origin.x, y: defaultButton.bounds.height + 5, width: screenWidth * 0.2, height: 1.5))
        currentButtonView.layer.backgroundColor = UIColor.whiteColor().CGColor
        self.view.addSubview(currentButtonView)
        
    }

    func leftKeyboard() {
        leftView = LeftKeyboardView(frame: CGRectZero)
        leftView.textDocumentaryProxy = (textDocumentProxy as UITextDocumentProxy)
        leftView.nextKeyboardButton.button.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        leftView.eraseButton.button.addTarget(self, action: #selector(KeyboardViewController.deleteText), forControlEvents: .TouchUpInside)
        leftView.eraseButton.button.addGestureRecognizer(longPressRecognizer)
        self.currentButtonView.removeFromSuperview()
        globals.tapped -= 1
        leftView.changeLetterCase()
        view = leftView
        viewDidLoad()
    }
    
    func rightKeyboard() {
        rightView = RightKeyboardView(frame: CGRectZero)
        rightView.textDocumentaryProxy = (textDocumentProxy as UITextDocumentProxy)
        rightView.nextKeyboardButton.button.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        rightView.eraseButton.button.addTarget(self, action: #selector(KeyboardViewController.deleteText), forControlEvents: .TouchUpInside)
        rightView.eraseButton.button.addGestureRecognizer(longPressRecognizer)
        self.currentButtonView.removeFromSuperview()
        globals.tapped -= 1
        rightView.changeLetterCase()
        view = rightView
        viewDidLoad()
    }
    
    func defaultKeyboard() {
        print("Test")
        defaultView = DefaultKeyboardView(frame: CGRectZero)
        defaultView.textDocumentaryProxy = (textDocumentProxy as UITextDocumentProxy)
        defaultView.nextKeyboardButton.button.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        defaultView.eraseButton.button.addTarget(self, action: #selector(KeyboardViewController.deleteText), forControlEvents: .TouchUpInside)
        defaultView.eraseButton.button.addGestureRecognizer(longPressRecognizer)
        if UIScreen.mainScreen().bounds.width < UIScreen.mainScreen().bounds.height {
            self.currentButtonView.removeFromSuperview()
            globals.tapped -= 1
            defaultView.changeLetterCase()
            view = defaultView
            viewDidLoad()
        }
    }
    
    func deleteText() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_async(dispatch_get_main_queue()) {
                if self.textDocumentProxy.documentContextBeforeInput?.isEmpty == false {
                    self.saveText = self.textDocumentProxy.documentContextBeforeInput! as String
                    self.textDocumentProxy.deleteBackward()
                    self.undoArray.append(self.saveText)
                    self.undoIndex += 1
                }
            }
        }
    }
    
    func cutText() {
        if let _ = self.textDocumentProxy.documentContextBeforeInput {
            let tokens = self.textDocumentProxy.documentContextBeforeInput! as String
            for _ in 0 ..< tokens.characters.count {
                self.textDocumentProxy.deleteBackward()
            }
            UIPasteboard.generalPasteboard().string = tokens as String
        }
        self.currentButtonView.frame.origin.x = self.cutButton.frame.origin.x
    }
    
    func copyText() {
        if let _ = self.textDocumentProxy.documentContextBeforeInput {
            let tokens = self.textDocumentProxy.documentContextBeforeInput! as String
            UIPasteboard.generalPasteboard().string = tokens as String
        }
        self.currentButtonView.frame.origin.x = self.copyButton.frame.origin.x
    }
    
    func pasteText() {
        let text = UIPasteboard.generalPasteboard().string!
        self.textDocumentProxy.insertText(text)
        self.currentButtonView.frame.origin.x = self.pasteButton.frame.origin.x
    }
    
    func undoText() {
        print("\(undoArray.count) = \(undoIndex)")
        if undoIndex > 0 {
            if let _ = self.textDocumentProxy.documentContextBeforeInput {
                let tokens = self.textDocumentProxy.documentContextBeforeInput! as String
                for _ in 0 ..< tokens.characters.count {
                    self.textDocumentProxy.deleteBackward()
                }
            }
            undoIndex -= 1
            self.textDocumentProxy.insertText(undoArray[undoIndex])
        }
        self.currentButtonView.frame.origin.x = self.undoButton.frame.origin.x
    }
    
    func clearText() {
        if let _ = self.textDocumentProxy.documentContextBeforeInput {
            let tokens = self.textDocumentProxy.documentContextBeforeInput! as String
            for _ in 0 ..< tokens.characters.count {
                self.textDocumentProxy.deleteBackward()
            }
        }
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if UIScreen.mainScreen().bounds.width < UIScreen.mainScreen().bounds.height {
            if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.Right:
                    rightKeyboard()
                case UISwipeGestureRecognizerDirection.Left:
                    leftKeyboard()
                case UISwipeGestureRecognizerDirection.Down:
                    self.clearText()
                default:
                    break
                }
            }
        }
    }
    
    func longPressHandler(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .Began {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(KeyboardViewController.handleTimer(_:)), userInfo: nil, repeats: true)
        } else if gesture.state == .Ended || gesture.state == .Cancelled {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func handleTimer(timer: NSTimer) {
        self.deleteText()
    }
    
}
