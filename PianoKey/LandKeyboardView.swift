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

class LandKeyboardButton : UIView {
    
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
        button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.03)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addSubview(button)
        
    }
    
    func goToNormalSize() {
        self.resetScalingWithAnimationDuration(0.01)
    }
    
    func enlargeForTouchDown() {
        self.scaleByFactor(1.3, animationDuration: 0.01)
    }
    
}

class LandKeyboardView : UIView {
    var buttons = [LandKeyboardButton]()
    var caseButton = LandKeyboardButton(buttonTitle: "")
    let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var nextLandKeyboardButton: LandKeyboardButton!
    var dotButton: LandKeyboardButton!
    var numberButton: LandKeyboardButton!
    var eraseButton: LandKeyboardButton!
    var spaceButtonWidth = UIScreen.mainScreen().bounds.width * 0.05
    var buttonWidth = UIScreen.mainScreen().bounds.height * 0.17
    let caseButtonWidth = UIScreen.mainScreen().bounds.width * 0.1
    var buttonHeight = UIScreen.mainScreen().bounds.height * 0.08
    var tapped = 2
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
        let spaceY = screenWidth * 0.005
        if screenWidth < 600 {
            buttonHeight = UIScreen.mainScreen().bounds.height * 0.11
            buttonWidth = UIScreen.mainScreen().bounds.height * 0.17
        }
        
        if screenWidth < 500 {
            buttonHeight = UIScreen.mainScreen().bounds.height * 0.11
            buttonWidth = UIScreen.mainScreen().bounds.height * 0.14
        }
        
        if screenWidth > 600 {
            buttonHeight = UIScreen.mainScreen().bounds.height * 0.08
        }
        
        let TButton = LandKeyboardButton(buttonTitle: "T")
        //TButton.backgroundColor = UIColor.blueColor()
        TButton.frame = CGRect(x: screenWidth * 0.5 - spaceY*0.5 - buttonWidth, y: screenWidth * 0.045, width: buttonWidth, height: buttonHeight)
        TButton.button.addTarget(self, action: #selector(LandKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        buttons.append(TButton)
        addSubview(TButton)
        
        let RButton = LandKeyboardButton(buttonTitle: "R")
        RButton.frame = CGRect(x: TButton.frame.origin.x - spaceY - buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(RButton)
        addSubview(RButton)
        
        let EButton = LandKeyboardButton(buttonTitle: "E")
        EButton.frame = CGRect(x: RButton.frame.origin.x - spaceY - buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(EButton)
        addSubview(EButton)
        
        let WButton = LandKeyboardButton(buttonTitle: "W")
        WButton.frame = CGRect(x: EButton.frame.origin.x - spaceY - buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(WButton)
        addSubview(WButton)
        
        let QButton = LandKeyboardButton(buttonTitle: "Q")
        QButton.frame = CGRect(x: WButton.frame.origin.x - spaceY - buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(QButton)
        addSubview(QButton)
        
        let YButton = LandKeyboardButton(buttonTitle: "Y")
        YButton.frame = CGRect(x: TButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(YButton)
        addSubview(YButton)
        
        let UButton = LandKeyboardButton(buttonTitle: "U")
        UButton.frame = CGRect(x: YButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(UButton)
        addSubview(UButton)
        
        let IButton = LandKeyboardButton(buttonTitle: "I")
        IButton.frame = CGRect(x: UButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(IButton)
        addSubview(IButton)
        
        let OButton = LandKeyboardButton(buttonTitle: "O")
        OButton.frame = CGRect(x: IButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(OButton)
        addSubview(OButton)
        
        let PButton = LandKeyboardButton(buttonTitle: "P")
        PButton.frame = CGRect(x: OButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(PButton)
        addSubview(PButton)
        
        let GButton = LandKeyboardButton(buttonTitle: "G")
        GButton.frame = CGRect(x: screenWidth * 0.5 - (buttonWidth * 0.5), y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(GButton)
        addSubview(GButton)
        
        let HButton = LandKeyboardButton(buttonTitle: "H")
        HButton.frame = CGRect(x: GButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(HButton)
        addSubview(HButton)
        
        let JButton = LandKeyboardButton(buttonTitle: "J")
        JButton.frame = CGRect(x: HButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(JButton)
        addSubview(JButton)
        
        let KButton = LandKeyboardButton(buttonTitle: "K")
        KButton.frame = CGRect(x: JButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(KButton)
        addSubview(KButton)
        
        let LButton = LandKeyboardButton(buttonTitle: "L")
        LButton.frame = CGRect(x: KButton.frame.origin.x + spaceY + buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(LButton)
        addSubview(LButton)
        
        let FButton = LandKeyboardButton(buttonTitle: "F")
        FButton.frame = CGRect(x: GButton.frame.origin.x - spaceY - buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(FButton)
        addSubview(FButton)
        
        let DButton = LandKeyboardButton(buttonTitle: "D")
        DButton.frame = CGRect(x: FButton.frame.origin.x - spaceY - buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(DButton)
        addSubview(DButton)
        
        let SButton = LandKeyboardButton(buttonTitle: "S")
        SButton.frame = CGRect(x: DButton.frame.origin.x - spaceY - buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(SButton)
        addSubview(SButton)
        
        let AButton = LandKeyboardButton(buttonTitle: "A")
        AButton.frame = CGRect(x: SButton.frame.origin.x - spaceY - buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(AButton)
        addSubview(AButton)
        
        let VButton = LandKeyboardButton(buttonTitle: "V")
        VButton.frame = CGRect(x: GButton.frame.origin.x, y: GButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(VButton)
        addSubview(VButton)
        
        let BButton = LandKeyboardButton(buttonTitle: "B")
        BButton.frame = CGRect(x: GButton.frame.origin.x + spaceY + buttonWidth, y: VButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(BButton)
        addSubview(BButton)
        
        let NButton = LandKeyboardButton(buttonTitle: "N")
        NButton.frame = CGRect(x: JButton.frame.origin.x, y: JButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(NButton)
        addSubview(NButton)
        
        let MButton = LandKeyboardButton(buttonTitle: "M")
        MButton.frame = CGRect(x: KButton.frame.origin.x, y: KButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(MButton)
        addSubview(MButton)
        
        let CButton = LandKeyboardButton(buttonTitle: "C")
        CButton.frame = CGRect(x: FButton.frame.origin.x, y: FButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(CButton)
        addSubview(CButton)
        
        let XButton = LandKeyboardButton(buttonTitle: "X")
        XButton.frame = CGRect(x: DButton.frame.origin.x, y: DButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(XButton)
        addSubview(XButton)
        
        let ZButton = LandKeyboardButton(buttonTitle: "Z")
        ZButton.frame = CGRect(x: SButton.frame.origin.x, y: SButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(ZButton)
        addSubview(ZButton)
        
        let bottomView = UIView(frame: CGRect(x: 0.0, y: XButton.frame.origin.y + buttonHeight + spaceY, width: screenWidth, height: screenWidth))
        //bottomView.layer.backgroundColor = secondaryColor.CGColor
        addSubview(bottomView)
        
        caseButton = LandKeyboardButton(buttonTitle: "")
        caseButton.frame = CGRect(x: AButton.frame.origin.x - spaceY - space, y: SButton.frame.origin.y + buttonHeight, width: caseButtonWidth, height: buttonHeight)
        caseButton.button.addTarget(self, action: #selector(LandKeyboardView.changeLetterCase), forControlEvents: .TouchUpInside)
        caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
        caseButton.button.contentMode = .Center
        caseButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(caseButton)
        
        eraseButton = LandKeyboardButton(buttonTitle: "")
        eraseButton.frame = CGRect(x: MButton.frame.origin.x + spaceY + buttonWidth, y: MButton.frame.origin.y, width: caseButtonWidth, height: buttonHeight)
        eraseButton.button.setImage(UIImage(named: "erase"), forState: .Normal)
        eraseButton.button.imageView?.contentMode = .ScaleAspectFit
        eraseButton.button.contentMode = .Center
        addSubview(eraseButton)
        
        let spaceButton = LandKeyboardButton(buttonTitle: " ")
        spaceButton.frame = CGRect(x: XButton.frame.origin.x, y: XButton.frame.origin.y + buttonHeight, width: buttonWidth*5 + spaceY*4, height: buttonHeight * 0.8)
        spaceButton.button.addTarget(self, action: #selector(LandKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        spaceButton.button.layer.backgroundColor = UIColor.whiteColor().CGColor
        spaceButton.button.layer.cornerRadius = 5
        addSubview(spaceButton)
        
        dotButton = LandKeyboardButton(buttonTitle: ".")
        dotButton.frame = CGRect(x: MButton.frame.origin.x, y: MButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        dotButton.button.addTarget(self, action: #selector(LandKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        dotButton.button.contentMode = .Center
        addSubview(dotButton)
        
        let doneButton = LandKeyboardButton(buttonTitle: "")
        doneButton.frame = CGRect(x: dotButton.frame.origin.x + buttonWidth + space, y: dotButton.frame.origin.y, width: caseButtonWidth, height: buttonHeight)
        doneButton.button.setImage(UIImage(named: "downline"), forState: .Normal)
        doneButton.button.contentMode = .Center
        addSubview(doneButton)
        
        nextLandKeyboardButton = LandKeyboardButton(buttonTitle: "")
        nextLandKeyboardButton.frame = CGRect(x: ZButton.frame.origin.x, y: ZButton.frame.origin.y +  buttonHeight, width: buttonWidth, height: buttonHeight)
        nextLandKeyboardButton.button.setImage(UIImage(named: "nextboard"), forState: .Normal)
        nextLandKeyboardButton.button.contentMode = .Center
        addSubview(nextLandKeyboardButton)
        addHandleTap()
        
        numberButton = LandKeyboardButton(buttonTitle: "123")
        numberButton.frame = CGRect(x: ZButton.frame.origin.x - space - caseButtonWidth, y: ZButton.frame.origin.y + buttonHeight, width: caseButtonWidth, height: buttonHeight)
        numberButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.03)
        numberButton.button.addTarget(self, action: #selector(LandKeyboardView.switchNumberPage), forControlEvents: .TouchUpInside)
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
        let upperCharacters = ["T", "R", "E", "W", "Q", "Y", "U", "I", "O", "P", "G", "H", "J", "K", "L", "F", "D", "S", "A", "V", "B", "N", "M", "C", "X", "Z"]
        for index in 0 ..< buttons.count {
            let title = upperCharacters[index].lowercaseString
            buttons[index].button.setTitle(title, forState: .Normal)
        }
    }
    
    func upperCase() {
        let upperCharacters = ["T", "R", "E", "W", "Q", "Y", "U", "I", "O", "P", "G", "H", "J", "K", "L", "F", "D", "S", "A", "V", "B", "N", "M", "C", "X", "Z"]
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
            tapped = 1
            caseButton.button.setTitle("", forState: .Normal)
            self.caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
            changeLetterCase()
            numberButton.button.setTitle("123", forState: .Normal)
            numberPageChanged = false
        } else {
            switchedToNumbers = true
            numberButton.button.setTitle("abc", forState: .Normal)
        }
    }
    
    func numberBoardFirstPage() {
        let symbolsFirstPage = ["5", "4", "3", "2", "1", "6", "7", "8", "9", "0", "/", "^", "&", "(", ")", "?", "#", "@", "!", "*", ":", ";", ",", "\"", "\'", "-"]
        for index in 0 ..< buttons.count {
            let title = symbolsFirstPage[index]
            buttons[index].button.setTitle(title, forState: .Normal)
        }
        caseButton.button.setTitle("1/2", forState: .Normal)
        self.caseButton.button.setImage(nil, forState: .Normal)
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