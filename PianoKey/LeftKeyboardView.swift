//
//  KeyboardView.swift
//  Piano
//
//  Created by Admin on 6/18/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension UIView {
    
    func scaleByFactor(factor: CGFloat, animationDuration: NSTimeInterval){
        UIView.animateWithDuration(animationDuration, animations: {[weak self] in
            let strongSelf = self!
            strongSelf.transform = CGAffineTransformMakeScale(factor, factor)
        })
    }
    
    func resetScalingWithAnimationDuration(duration: NSTimeInterval){
        scaleByFactor(1.0, animationDuration: duration)
    }
}

class KeyboardButton : UIView {
 
    var button: UIButton!
    var audioPlayer: AVAudioPlayer!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(buttonTitle: String) {
        super.init(frame: CGRectZero)
        button = UIButton(type: .Custom)
        button.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        button.setTitle(buttonTitle, forState: .Normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.065)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: #selector(enlargeForTouchDown), forControlEvents: .TouchDown)
        button.addTarget(self, action: #selector(goToNormalSize), forControlEvents: UIControlEvents.AllEvents.exclusiveOr(.TouchDown))
        addSubview(button)
    }
    
    func goToNormalSize() {
        self.resetScalingWithAnimationDuration(0.3)
    }
    
    func enlargeForTouchDown() {
        self.scaleByFactor(3, animationDuration: 0.3)
    }
    
}

class LeftKeyboardView : UIView {
    
    var buttons = [KeyboardButton]()
    var caseButton = KeyboardButton(buttonTitle: "")
    let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var nextKeyboardButton: KeyboardButton!
    var dotButton: KeyboardButton!
    var numberButton: KeyboardButton!
    var eraseButton: KeyboardButton!
    let buttonWidth = UIScreen.mainScreen().bounds.width * 0.12
    let caseButtonWidth = UIScreen.mainScreen().bounds.width * 0.1
    var numberPageChanged = false
    var switchedToNumbers = false
    let mainColor = UIColor(red: 177/255, green: 207/255, blue: 181/255, alpha: 1.0)
    
    weak var textDocumentaryProxy: UITextDocumentProxy? {
        willSet(newValue) {
            if let proxy = newValue {
                if proxy.keyboardAppearance! == .Dark {
                    backgroundColor = UIColor(red: 52/255, green: 74/255, blue: 97/255, alpha: 1.0)
                } else {
                    backgroundColor = UIColor(red: 52/255, green: 74/255, blue: 97/255, alpha: 1.0)
                }
            }
        }
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let space = screenWidth * 0.01
        let spaceY = screenWidth * 0.02
        let buttonHeight = screenWidth * 0.11
        
        let QButton = KeyboardButton(buttonTitle: "Q")
        QButton.frame = CGRect(x: screenWidth * 0.005, y: spaceY*5, width: buttonWidth, height: buttonHeight)
        buttons.append(QButton)
        addSubview(QButton)
        
        let WButton = KeyboardButton(buttonTitle: "W")
        WButton.frame = CGRect(x: QButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(WButton)
        addSubview(WButton)
        
        let EButton = KeyboardButton(buttonTitle: "E")
        EButton.frame = CGRect(x: WButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(EButton)
        addSubview(EButton)
        
        let RButton = KeyboardButton(buttonTitle: "R")
        RButton.frame = CGRect(x: EButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(RButton)
        addSubview(RButton)
        
        let TButton = KeyboardButton(buttonTitle: "T")
        TButton.frame = CGRect(x: RButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(TButton)
        addSubview(TButton)
        
        let YButton = KeyboardButton(buttonTitle: "Y")
        YButton.frame = CGRect(x: TButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        YButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(YButton)
        addSubview(YButton)
        
        let UButton = KeyboardButton(buttonTitle: "U")
        UButton.frame = CGRect(x: YButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        UButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(UButton)
        addSubview(UButton)
        
        let IButton = KeyboardButton(buttonTitle: "I")
        IButton.frame = CGRect(x: UButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        IButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(IButton)
        addSubview(IButton)
        
        let OButton = KeyboardButton(buttonTitle: "O")
        OButton.frame = CGRect(x: IButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        OButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(OButton)
        addSubview(OButton)
        
        let PButton = KeyboardButton(buttonTitle: "P")
        PButton.frame = CGRect(x: OButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        PButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(PButton)
        addSubview(PButton)
        
        let AButton = KeyboardButton(buttonTitle: "A")
        AButton.frame = CGRect(x: QButton.frame.origin.x, y: QButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(AButton)
        addSubview(AButton)
        
        let SButton = KeyboardButton(buttonTitle: "S")
        SButton.frame = CGRect(x: AButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y +  buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(SButton)
        addSubview(SButton)
        
        let DButton = KeyboardButton(buttonTitle: "D")
        DButton.frame = CGRect(x: EButton.frame.origin.x, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(DButton)
        addSubview(DButton)
        
        let FButton = KeyboardButton(buttonTitle: "F")
        FButton.frame = CGRect(x: DButton.frame.origin.x + space + buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(FButton)
        addSubview(FButton)
        
        let GButton = KeyboardButton(buttonTitle: "G")
        GButton.frame = CGRect(x: FButton.frame.origin.x + space + buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(GButton)
        addSubview(GButton)
        
        let HButton = KeyboardButton(buttonTitle: "H")
        HButton.frame = CGRect(x: GButton.frame.origin.x + space + buttonWidth, y: GButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        HButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(HButton)
        addSubview(HButton)
        
        let JButton = KeyboardButton(buttonTitle: "J")
        JButton.frame = CGRect(x: HButton.frame.origin.x + space + buttonWidth * 0.5, y: HButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        JButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(JButton)
        addSubview(JButton)
        
        let KButton = KeyboardButton(buttonTitle: "K")
        KButton.frame = CGRect(x: JButton.frame.origin.x + space + buttonWidth * 0.5, y: JButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        KButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(KButton)
        addSubview(KButton)
        
        let LButton = KeyboardButton(buttonTitle: "L")
        LButton.frame = CGRect(x: KButton.frame.origin.x + space + buttonWidth * 0.5, y: KButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        LButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(LButton)
        addSubview(LButton)
        
        let XButton = KeyboardButton(buttonTitle: "X")
        XButton.frame = CGRect(x: DButton.frame.origin.x, y: DButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(XButton)
        addSubview(XButton)
        
        let CButton = KeyboardButton(buttonTitle: "C")
        CButton.frame = CGRect(x: FButton.frame.origin.x, y: FButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(CButton)
        addSubview(CButton)
        
        let VButton = KeyboardButton(buttonTitle: "V")
        VButton.frame = CGRect(x: GButton.frame.origin.x, y: CButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(VButton)
        addSubview(VButton)
        
        let ZButton = KeyboardButton(buttonTitle: "Z")
        ZButton.frame = CGRect(x: SButton.frame.origin.x, y: SButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(ZButton)
        addSubview(ZButton)
        
        let BButton = KeyboardButton(buttonTitle: "B")
        BButton.frame = CGRect(x: HButton.frame.origin.x, y: CButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        BButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(BButton)
        addSubview(BButton)
        
        let NButton = KeyboardButton(buttonTitle: "N")
        NButton.frame = CGRect(x: BButton.frame.origin.x + space + buttonWidth * 0.5, y: BButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        NButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(NButton)
        addSubview(NButton)
        
        let MButton = KeyboardButton(buttonTitle: "M")
        MButton.frame = CGRect(x: NButton.frame.origin.x + space + buttonWidth * 0.5, y: NButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        MButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: screenWidth * 0.04)
        buttons.append(MButton)
        addSubview(MButton)
        
        let spaceButton = KeyboardButton(buttonTitle: " ")
        spaceButton.frame = CGRect(x: screenWidth * 0.5 - buttonWidth * 2, y: XButton.frame.origin.y + buttonHeight + spaceY*0.5, width: buttonWidth*4, height: 35.0)
        spaceButton.button.addTarget(self, action: #selector(LeftKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        spaceButton.button.layer.backgroundColor = UIColor.whiteColor().CGColor
        spaceButton.button.layer.cornerRadius = 5
        addSubview(spaceButton)
        
        
        caseButton = KeyboardButton(buttonTitle: "")
        caseButton.frame = CGRect(x: 0.0, y: ZButton.frame.origin.y, width: caseButtonWidth * 1.5, height: buttonHeight)
        caseButton.button.addTarget(self, action: #selector(LeftKeyboardView.changeLetterCase), forControlEvents: .TouchUpInside)
        caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
        caseButton.button.contentMode = .Center
        caseButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(caseButton)
        
        eraseButton = KeyboardButton(buttonTitle: "")
        eraseButton.frame = CGRect(x: screenWidth * 0.85, y: CButton.frame.origin.y, width: caseButtonWidth * 1.5, height: buttonHeight)
        eraseButton.button.setImage(UIImage(named: "erase"), forState: .Normal)
        eraseButton.button.contentMode = .Center
        eraseButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(eraseButton)
        
        dotButton = KeyboardButton(buttonTitle: ".")
        dotButton.frame = CGRect(x: spaceButton.frame.origin.x + buttonWidth * 4 + space, y: spaceButton.frame.origin.y, width: buttonWidth, height: 35.0)
        dotButton.button.addTarget(self, action: #selector(LeftKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        dotButton.button.contentMode = .Center
        addSubview(dotButton)
        
        let doneButton = KeyboardButton(buttonTitle: "")
        doneButton.frame = CGRect(x: dotButton.frame.origin.x + buttonWidth + space, y: dotButton.frame.origin.y, width: caseButtonWidth, height: 35.0)
        doneButton.button.setImage(UIImage(named: "downline"), forState: .Normal)
        doneButton.button.contentMode = .Center
        doneButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(doneButton)
        
        nextKeyboardButton = KeyboardButton(buttonTitle: "")
        nextKeyboardButton.frame = CGRect(x: spaceButton.frame.origin.x - space - buttonWidth, y: spaceButton.frame.origin.y, width: buttonWidth, height: 35.0)
        nextKeyboardButton.button.setImage(UIImage(named: "nextboard"), forState: .Normal)
        nextKeyboardButton.button.contentMode = .Center
        addSubview(nextKeyboardButton)
        addHandleTap()
        
        numberButton = KeyboardButton(buttonTitle: "123")
        numberButton.frame = CGRect(x: nextKeyboardButton.frame.origin.x - space - caseButtonWidth, y: spaceButton.frame.origin.y, width: caseButtonWidth, height: 35.0)
        numberButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.05)
        numberButton.button.addTarget(self, action: #selector(LeftKeyboardView.switchNumberPage), forControlEvents: .TouchUpInside)
        numberButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(numberButton)

    }
    
    func handleTapOnButton(button: UIButton) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_async(dispatch_get_main_queue()) {
                let buttonText = button.titleForState(.Normal)
                if let proxy = self.textDocumentaryProxy {
                    if button.titleForState(.Normal) == " " {
                        proxy.insertText(" ")
                    } else {
                        proxy.insertText(buttonText!)
                    }
                }
                if globals.tapped != 3 && (self.switchedToNumbers == false){
                    self.lowerCase()
                    self.caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
                    globals.tapped = 1
                }
            }
        }
    }
    
    func addHandleTap() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_async(dispatch_get_main_queue()) {
                for button in self.buttons {
                    button.button.addTarget(self, action: #selector(DefaultKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
                }
            }
        }
    }
    
    func lowerCase() {
        let upperCharacters = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "X", "C", "V", "Z", "B", "N", "M"]
        for index in 0 ..< buttons.count {
            let title = upperCharacters[index].lowercaseString
            buttons[index].button.setTitle(title, forState: .Normal)
        }
    }
    
    func upperCase() {
        let upperCharacters = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "X", "C", "V", "Z", "B", "N", "M"]
        for index in 0 ..< buttons.count {
            let title = upperCharacters[index]
            buttons[index].button.setTitle(title, forState: .Normal)
        }
    }
    
    func changeLetterCase() {
        if self.switchedToNumbers == false {
            globals.tapped += 1
            if globals.tapped == 1 {
                self.lowerCase()
                caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
            } else if globals.tapped == 2 {
                self.upperCase()
                caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
            } else if globals.tapped == 3{
                self.upperCase()
                caseButton.button.setImage(UIImage(named: "caseup"), forState: .Normal)
            } else {
                caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
                self.lowerCase()
                globals.tapped = 1
            }
        } else {
            self.changeNumberPage()
        }
    }
    
    func changeNumberPage() {
        if numberPageChanged {
            numberBoardSecondPage()
            numberPageChanged = false
        } else {
            numberBoardFirstPage()
            numberPageChanged = true
        }
    }
    
    func switchNumberPage() {
        changeNumberPage()
        if switchedToNumbers {
            switchedToNumbers = false
            globals.tapped = 1
            caseButton.button.setTitle("", forState: .Normal)
            caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
            changeLetterCase()
            numberButton.button.setTitle("123", forState: .Normal)
            numberPageChanged = false
        } else {
            switchedToNumbers = true
            numberButton.button.setTitle("abc", forState: .Normal)
        }
    }
    
    func numberBoardFirstPage() {
        let symbolsFirstPage = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "/", "^", "&", "(", ")", "?", "#", "@", "!", "*", ":", ";", ",", "\"", "\'", "-"]
        for index in 0 ..< buttons.count {
            let title = symbolsFirstPage[index]
            buttons[index].button.setTitle(title, forState: .Normal)
        }
        caseButton.button.setImage(nil, forState: .Normal)
        caseButton.button.setTitle("1/2", forState: .Normal)
    }
    
    func numberBoardSecondPage() {
        let symbolsSecondPage = ["<", "=", "÷", "×", "+", ">", "{", "}", "[", "]", "%", "~", "`", "©", "®", "$", "¥", "£", "€", "_", "\\", "|", "§", "¤", "¡", "."]
        for index in 0 ..< buttons.count {
            let title = symbolsSecondPage[index]
            buttons[index].button.setTitle(title, forState: .Normal)
        }
        caseButton.button.setTitle("2/2", forState: .Normal)
    }
    
}