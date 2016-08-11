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

class DefaultKeyboardView : UIView {
    
    var buttons = [KeyboardButton]()
    var caseButton = KeyboardButton(buttonTitle: "")
    let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var nextKeyboardButton: KeyboardButton!
    var dotButton: KeyboardButton!
    var numberButton: KeyboardButton!
    var eraseButton: KeyboardButton!
    var spaceButtonWidth = UIScreen.mainScreen().bounds.width * 0.12
    let buttonWidth = UIScreen.mainScreen().bounds.width * 0.1
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
        let screenHeight = UIScreen.mainScreen().bounds.height
        let space = screenWidth * 0.02
        let spaceY = screenWidth * 0.02
        var buttonHeight = screenWidth * 0.145
        print(screenHeight/screenWidth)
        if screenWidth < 350 {
            buttonHeight = screenWidth * 0.145
        } else {
            buttonHeight = screenWidth * 0.11
        }
        
        
        
        let QButton = KeyboardButton(buttonTitle: "Q")
        QButton.frame = CGRect(x: 0.0, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(QButton)
        addSubview(QButton)
        
        let WButton = KeyboardButton(buttonTitle: "W")
        WButton.frame = CGRect(x: screenWidth * 0.1, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(WButton)
        addSubview(WButton)
        
        let EButton = KeyboardButton(buttonTitle: "E")
        EButton.frame = CGRect(x: screenWidth * 0.2, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(EButton)
        addSubview(EButton)
        
        let RButton = KeyboardButton(buttonTitle: "R")
        RButton.frame = CGRect(x: screenWidth * 0.3, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(RButton)
        addSubview(RButton)
        
        let TButton = KeyboardButton(buttonTitle: "T")
        TButton.frame = CGRect(x: screenWidth * 0.4, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        TButton.button.addTarget(self, action: #selector(DefaultKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        buttons.append(TButton)
        addSubview(TButton)
        
        let YButton = KeyboardButton(buttonTitle: "Y")
        YButton.frame = CGRect(x: screenWidth * 0.5, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(YButton)
        addSubview(YButton)
        
        let UButton = KeyboardButton(buttonTitle: "U")
        UButton.frame = CGRect(x: screenWidth * 0.6, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(UButton)
        addSubview(UButton)
        
        let IButton = KeyboardButton(buttonTitle: "I")
        IButton.frame = CGRect(x: screenWidth * 0.7, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(IButton)
        addSubview(IButton)
        
        let OButton = KeyboardButton(buttonTitle: "O")
        OButton.frame = CGRect(x: screenWidth * 0.8, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(OButton)
        addSubview(OButton)
        
        let PButton = KeyboardButton(buttonTitle: "P")
        PButton.frame = CGRect(x: screenWidth * 0.9, y: screenWidth * 0.1, width: buttonWidth, height: buttonHeight)
        buttons.append(PButton)
        addSubview(PButton)
        
        let GButton = KeyboardButton(buttonTitle: "G")
        GButton.frame = CGRect(x: screenWidth * 0.5 - (buttonWidth * 0.5), y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(GButton)
        addSubview(GButton)
        
        let HButton = KeyboardButton(buttonTitle: "H")
        HButton.frame = CGRect(x: GButton.frame.origin.x + buttonWidth, y: TButton.frame.origin.y +  buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(HButton)
        addSubview(HButton)
        
        let JButton = KeyboardButton(buttonTitle: "J")
        JButton.frame = CGRect(x: HButton.frame.origin.x + buttonWidth, y: TButton.frame.origin.y +  buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(JButton)
        addSubview(JButton)
        
        let LButton = KeyboardButton(buttonTitle: "L")
        LButton.frame = CGRect(x: JButton.frame.origin.x + buttonWidth*1.5, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth*2, height: buttonHeight)
        buttons.append(LButton)
        addSubview(LButton)
        
        let KButton = KeyboardButton(buttonTitle: "K")
        KButton.frame = CGRect(x: JButton.frame.origin.x + buttonWidth, y: TButton.frame.origin.y +  buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(KButton)
        addSubview(KButton)
        
        let FButton = KeyboardButton(buttonTitle: "F")
        FButton.frame = CGRect(x: GButton.frame.origin.x - buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(FButton)
        addSubview(FButton)
        
        let DButton = KeyboardButton(buttonTitle: "D")
        DButton.frame = CGRect(x: FButton.frame.origin.x - buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(DButton)
        addSubview(DButton)
        
        let AButton = KeyboardButton(buttonTitle: "A")
        AButton.frame = CGRect(x: 0.0, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth * 2.2, height: buttonHeight)
        buttons.append(AButton)
        addSubview(AButton)
        
        let SButton = KeyboardButton(buttonTitle: "S")
        SButton.frame = CGRect(x: DButton.frame.origin.x - buttonWidth, y: TButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(SButton)
        addSubview(SButton)
        
        let VButton = KeyboardButton(buttonTitle: "V")
        VButton.frame = CGRect(x: GButton.frame.origin.x, y: GButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(VButton)
        addSubview(VButton)
        
        let BButton = KeyboardButton(buttonTitle: "B")
        BButton.frame = CGRect(x: GButton.frame.origin.x + buttonWidth, y: VButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(BButton)
        addSubview(BButton)
        
        let NButton = KeyboardButton(buttonTitle: "N")
        NButton.frame = CGRect(x: JButton.frame.origin.x, y: JButton.frame.origin.y +  buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(NButton)
        addSubview(NButton)
        
        let MButton = KeyboardButton(buttonTitle: "M")
        MButton.frame = CGRect(x: KButton.frame.origin.x, y: KButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(MButton)
        addSubview(MButton)
        
        let CButton = KeyboardButton(buttonTitle: "C")
        CButton.frame = CGRect(x: FButton.frame.origin.x, y: FButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(CButton)
        addSubview(CButton)
        
        let XButton = KeyboardButton(buttonTitle: "X")
        XButton.frame = CGRect(x: DButton.frame.origin.x, y: DButton.frame.origin.y +  buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(XButton)
        addSubview(XButton)
        
        let ZButton = KeyboardButton(buttonTitle: "Z")
        ZButton.frame = CGRect(x: SButton.frame.origin.x, y: SButton.frame.origin.y +  buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(ZButton)
        addSubview(ZButton)
        
        let bottomView = UIView(frame: CGRect(x: 0.0, y: XButton.frame.origin.y + buttonHeight + spaceY, width: screenWidth, height: screenWidth))
        //bottomView.layer.backgroundColor = secondaryColor.CGColor
        addSubview(bottomView)
        
        caseButton = KeyboardButton(buttonTitle: "")
        caseButton.frame = CGRect(x: 0.0
            , y: SButton.frame.origin.y +  buttonHeight, width: caseButtonWidth * 1.5, height: buttonHeight)
        caseButton.button.addTarget(self, action: #selector(DefaultKeyboardView.changeLetterCase), forControlEvents: .TouchUpInside)
        caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
        caseButton.button.contentMode = .Center
        caseButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(caseButton)
        
        eraseButton = KeyboardButton(buttonTitle: "")
        eraseButton.frame = CGRect(x: screenWidth * 0.85, y: MButton.frame.origin.y, width: caseButtonWidth*1.5, height: buttonHeight)
        eraseButton.button.setImage(UIImage(named: "erase"), forState: .Normal)
        eraseButton.button.contentMode = .Left
        eraseButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(eraseButton)
        
        let spaceButton = KeyboardButton(buttonTitle: " ")
        spaceButton.frame = CGRect(x: screenWidth * 0.5 - spaceButtonWidth * 2, y: XButton.frame.origin.y + buttonHeight + spaceY, width: spaceButtonWidth*4, height: 30.0)
        spaceButton.button.addTarget(self, action: #selector(DefaultKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        spaceButton.button.layer.backgroundColor = UIColor.whiteColor().CGColor
        spaceButton.button.layer.cornerRadius = 5
        addSubview(spaceButton)
        
        dotButton = KeyboardButton(buttonTitle: ".")
        dotButton.frame = CGRect(x: MButton.frame.origin.x, y: MButton.frame.origin.y + spaceY + buttonHeight, width: buttonWidth, height: 30.0)
        dotButton.button.addTarget(self, action: #selector(DefaultKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        dotButton.button.contentMode = .Center
        addSubview(dotButton)
        
        let doneButton = KeyboardButton(buttonTitle: "\n")
        doneButton.frame = CGRect(x: dotButton.frame.origin.x + buttonWidth + space, y: dotButton.frame.origin.y, width: caseButtonWidth, height: 30.0)
        doneButton.button.setImage(UIImage(named: "downline"), forState: .Normal)
        doneButton.button.contentMode = .Center
        doneButton.button.imageView?.contentMode = .ScaleAspectFit
        doneButton.button.addTarget(self, action: #selector(DefaultKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        addSubview(doneButton)
        
        nextKeyboardButton = KeyboardButton(buttonTitle: "")
        nextKeyboardButton.frame = CGRect(x: ZButton.frame.origin.x, y: ZButton.frame.origin.y + spaceY + buttonHeight, width: buttonWidth, height: 30.0)
        nextKeyboardButton.button.setImage(UIImage(named: "nextboard"), forState: .Normal)
        nextKeyboardButton.button.contentMode = .Center
        nextKeyboardButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(nextKeyboardButton)
        
        addHandleTap()
        
        numberButton = KeyboardButton(buttonTitle: "123")
        numberButton.frame = CGRect(x: ZButton.frame.origin.x - space - caseButtonWidth, y: ZButton.frame.origin.y + spaceY + buttonHeight, width: caseButtonWidth * 1.2, height: 30.0)
        numberButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.05)
        numberButton.button.addTarget(self, action: #selector(DefaultKeyboardView.switchNumberPage), forControlEvents: .TouchUpInside)
        addSubview(numberButton)
        
        if screenWidth > 700 && screenHeight > 1000 {
            nextKeyboardButton.frame = CGRect(x: 0, y: 0, width: buttonWidth*2, height: buttonWidth*2)
            nextKeyboardButton.layer.backgroundColor = UIColor.whiteColor().CGColor
        }
        
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
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let upperCharacters = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "G", "H", "J", "L", "K", "F", "D", "A", "S", "V", "B", "N", "M", "C", "X", "Z"]
            dispatch_async(dispatch_get_main_queue()) {
                for index in 0 ..< self.buttons.count {
                    let title = upperCharacters[index].lowercaseString
                    self.buttons[index].button.setTitle(title, forState: .Normal)
                }
            }
        }
    }
    
    func upperCase() {
            let upperCharacters = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "G", "H", "J", "L", "K", "F", "D", "A", "S", "V", "B", "N", "M", "C", "X", "Z"]
                for index in 0 ..< self.buttons.count {
                    let title = upperCharacters[index]
                    self.buttons[index].button.setTitle(title, forState: .Normal)
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
                    } else if globals.tapped == 3 {
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
                if self.numberPageChanged {
                    self.numberBoardSecondPage()
                    self.numberPageChanged = false
                } else {
                    self.numberBoardFirstPage()
                    self.numberPageChanged = true
                }
    }
    
    func switchNumberPage() {
                self.changeNumberPage()
                if self.switchedToNumbers {
                    self.switchedToNumbers = false
                    globals.tapped = 1
                    self.caseButton.button.setTitle("", forState: .Normal)
                    self.caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
                    self.changeLetterCase()
                    self.numberButton.button.setTitle("123", forState: .Normal)
                    self.numberPageChanged = false
                } else {
                    self.switchedToNumbers = true
                    self.numberButton.button.setTitle("abc", forState: .Normal)
                }
    }
    
    func numberBoardFirstPage() {
                let symbolsFirstPage = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "(", ")", "&", "/", "^", "?", "#", "@", "!", "*", ":", ";", ",", "\"", "\'", "-"]
                for index in 0 ..< self.buttons.count {
                    let title = symbolsFirstPage[index]
                    self.buttons[index].button.setTitle(title, forState: .Normal)
                }
                self.caseButton.button.setTitle("1/2", forState: .Normal)
                self.caseButton.button.setImage(nil, forState: .Normal)
    }
    
    func numberBoardSecondPage() {
                let symbolsSecondPage = ["<", "=", "÷", "×", "+", ">", "{", "}", "[", "]", "%", "~", "`", "©", "®", "$", "¥", "£", "€", "_", "\\", "|", "§", "¤", "¡", "."]
                for index in 0 ..< self.buttons.count {
                    let title = symbolsSecondPage[index]
                    self.buttons[index].button.setTitle(title, forState: .Normal)
                }
                self.caseButton.button.setTitle("2/2", forState: .Normal)
    }

}