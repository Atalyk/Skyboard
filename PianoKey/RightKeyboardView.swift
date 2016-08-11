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

class RightKeyboardView : UIView {
    
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
        let screenHeight = UIScreen.mainScreen().bounds.height
        let space = screenWidth * 0.01
        let spaceY = screenWidth * 0.02
        var buttonHeight = screenWidth * 0.145
        if screenWidth < 350 {
            buttonHeight = screenWidth * 0.145
        } else {
            buttonHeight = screenWidth * 0.11
        }
        
        let QButton = KeyboardButton(buttonTitle: "Q")
        QButton.frame = CGRect(x: screenWidth * 0.005, y: spaceY*5, width: buttonWidth * 0.5, height: buttonHeight)
        QButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(QButton)
        addSubview(QButton)
        
        let WButton = KeyboardButton(buttonTitle: "W")
        WButton.frame = CGRect(x: QButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        WButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(WButton)
        addSubview(WButton)
        
        let EButton = KeyboardButton(buttonTitle: "E")
        EButton.frame = CGRect(x: WButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        EButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(EButton)
        addSubview(EButton)
        
        let RButton = KeyboardButton(buttonTitle: "R")
        RButton.frame = CGRect(x: EButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        RButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(RButton)
        addSubview(RButton)
        
        let TButton = KeyboardButton(buttonTitle: "T")
        TButton.frame = CGRect(x: RButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        TButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(TButton)
        addSubview(TButton)
        
        let YButton = KeyboardButton(buttonTitle: "Y")
        YButton.frame = CGRect(x: TButton.frame.origin.x + space + buttonWidth * 0.5, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(YButton)
        addSubview(YButton)
        
        let UButton = KeyboardButton(buttonTitle: "U")
        UButton.frame = CGRect(x: YButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(UButton)
        addSubview(UButton)
        
        let IButton = KeyboardButton(buttonTitle: "I")
        IButton.frame = CGRect(x: UButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(IButton)
        addSubview(IButton)
        
        let OButton = KeyboardButton(buttonTitle: "O")
        OButton.frame = CGRect(x: IButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(OButton)
        addSubview(OButton)
        
        let PButton = KeyboardButton(buttonTitle: "P")
        PButton.frame = CGRect(x: OButton.frame.origin.x + space + buttonWidth, y: QButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(PButton)
        addSubview(PButton)
        
        let AButton = KeyboardButton(buttonTitle: "A")
        AButton.frame = CGRect(x: WButton.frame.origin.x, y: QButton.frame.origin.y + buttonHeight, width: buttonWidth * 0.5, height: buttonHeight)
        AButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(AButton)
        addSubview(AButton)
        
        let SButton = KeyboardButton(buttonTitle: "S")
        SButton.frame = CGRect(x: EButton.frame.origin.x, y: QButton.frame.origin.y + buttonHeight, width: buttonWidth * 0.5, height: buttonHeight)
        SButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(SButton)
        addSubview(SButton)
        
        let DButton = KeyboardButton(buttonTitle: "D")
        DButton.frame = CGRect(x: RButton.frame.origin.x, y: AButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        DButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(DButton)
        addSubview(DButton)
        
        let FButton = KeyboardButton(buttonTitle: "F")
        FButton.frame = CGRect(x: TButton.frame.origin.x, y: SButton.frame.origin.y, width: buttonWidth * 0.5, height: buttonHeight)
        FButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(FButton)
        addSubview(FButton)
        
        let GButton = KeyboardButton(buttonTitle: "G")
        GButton.frame = CGRect(x: YButton.frame.origin.x, y: UButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(GButton)
        addSubview(GButton)
        
        let HButton = KeyboardButton(buttonTitle: "H")
        HButton.frame = CGRect(x: GButton.frame.origin.x + space + buttonWidth, y: GButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(HButton)
        addSubview(HButton)
        
        let JButton = KeyboardButton(buttonTitle: "J")
        JButton.frame = CGRect(x: HButton.frame.origin.x + space + buttonWidth, y: GButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(JButton)
        addSubview(JButton)
        
        let KButton = KeyboardButton(buttonTitle: "K")
        KButton.frame = CGRect(x: JButton.frame.origin.x + space + buttonWidth, y: GButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(KButton)
        addSubview(KButton)
        
        let LButton = KeyboardButton(buttonTitle: "L")
        LButton.frame = CGRect(x: KButton.frame.origin.x + space + buttonWidth, y: GButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(LButton)
        addSubview(LButton)
        
        let XButton = KeyboardButton(buttonTitle: "X")
        XButton.frame = CGRect(x: DButton.frame.origin.x, y: DButton.frame.origin.y + buttonHeight, width: buttonWidth * 0.5, height: buttonHeight)
        XButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(XButton)
        addSubview(XButton)
        
        let CButton = KeyboardButton(buttonTitle: "C")
        CButton.frame = CGRect(x: FButton.frame.origin.x, y: FButton.frame.origin.y + buttonHeight, width: buttonWidth * 0.5, height: buttonHeight)
        CButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(CButton)
        addSubview(CButton)
        
        let VButton = KeyboardButton(buttonTitle: "V")
        VButton.frame = CGRect(x: GButton.frame.origin.x, y: GButton.frame.origin.y + buttonHeight, width: buttonWidth, height: buttonHeight)
        buttons.append(VButton)
        addSubview(VButton)
        
        let ZButton = KeyboardButton(buttonTitle: "Z")
        ZButton.frame = CGRect(x: SButton.frame.origin.x, y: SButton.frame.origin.y + buttonHeight, width: buttonWidth * 0.5, height: buttonHeight)
        ZButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.04)
        buttons.append(ZButton)
        addSubview(ZButton)
        
        let BButton = KeyboardButton(buttonTitle: "B")
        BButton.frame = CGRect(x: HButton.frame.origin.x, y: VButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        buttons.append(BButton)
        addSubview(BButton)
        
        let NButton = KeyboardButton(buttonTitle: "N")
        NButton.frame = CGRect(x: BButton.frame.origin.x + space + buttonWidth, y: BButton.frame.origin.y, width: buttonWidth, height: buttonHeight)
        
        buttons.append(NButton)
        addSubview(NButton)
        
        let MButton = KeyboardButton(buttonTitle: "M")
        MButton.frame = CGRect(x: NButton.frame.origin.x + space + buttonWidth, y: NButton.frame.origin.y, width: buttonWidth , height: buttonHeight)
        buttons.append(MButton)
        addSubview(MButton)
        
        caseButton = KeyboardButton(buttonTitle: "")
        caseButton.frame = CGRect(x: 0.0, y: ZButton.frame.origin.y, width: caseButtonWidth * 1.5, height: buttonHeight)
        caseButton.button.addTarget(self, action: #selector(RightKeyboardView.changeLetterCase), forControlEvents: .TouchUpInside)
        caseButton.button.setImage(UIImage(named: "casedown"), forState: .Normal)
        caseButton.button.contentMode = .Center
        caseButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(caseButton)
        
        eraseButton = KeyboardButton(buttonTitle: "")
        eraseButton.frame = CGRect(x: screenWidth * 0.85, y: VButton.frame.origin.y, width: caseButtonWidth * 1.5, height: buttonHeight)
        eraseButton.button.setImage(UIImage(named: "erase"), forState: .Normal)
        eraseButton.button.contentMode = .Center
        eraseButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(eraseButton)
        
        let spaceButton = KeyboardButton(buttonTitle: " ")
        spaceButton.frame = CGRect(x: screenWidth * 0.5 - buttonWidth * 2, y: XButton.frame.origin.y + buttonHeight + spaceY, width: buttonWidth*4, height: 30.0)
        spaceButton.button.addTarget(self, action: #selector(RightKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        spaceButton.button.layer.backgroundColor = UIColor.whiteColor().CGColor
        spaceButton.button.layer.cornerRadius = 5
        addSubview(spaceButton)
        
        dotButton = KeyboardButton(buttonTitle: ".")
        dotButton.frame = CGRect(x: spaceButton.frame.origin.x + buttonWidth * 4 + space, y: spaceButton.frame.origin.y, width: buttonWidth, height: 30.0)
        dotButton.button.addTarget(self, action: #selector(RightKeyboardView.handleTapOnButton(_:)), forControlEvents: .TouchUpInside)
        dotButton.button.contentMode = .Center
        addSubview(dotButton)
        
        let doneButton = KeyboardButton(buttonTitle: "")
        doneButton.frame = CGRect(x: dotButton.frame.origin.x + buttonWidth + space, y: dotButton.frame.origin.y, width: caseButtonWidth, height: 30.0)
        doneButton.button.setImage(UIImage(named: "downline"), forState: .Normal)
        doneButton.button.contentMode = .Center
        doneButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(doneButton)
        
        nextKeyboardButton = KeyboardButton(buttonTitle: "")
        nextKeyboardButton.frame = CGRect(x: spaceButton.frame.origin.x - space - buttonWidth, y: ZButton.frame.origin.y + spaceY + buttonHeight, width: buttonWidth, height: 30.0)
        nextKeyboardButton.button.setImage(UIImage(named: "nextboard"), forState: .Normal)
        nextKeyboardButton.button.contentMode = .Center
        nextKeyboardButton.button.imageView?.contentMode = .ScaleAspectFit
        addSubview(nextKeyboardButton)
        addHandleTap()
        
        numberButton = KeyboardButton(buttonTitle: "123")
        numberButton.frame = CGRect(x: nextKeyboardButton.frame.origin.x - space - caseButtonWidth, y: ZButton.frame.origin.y + spaceY + buttonHeight, width: caseButtonWidth, height: 30.0)
        numberButton.button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: UIScreen.mainScreen().bounds.width * 0.05)
        numberButton.button.addTarget(self, action: #selector(RightKeyboardView.switchNumberPage), forControlEvents: .TouchUpInside)
        addSubview(numberButton)
        
        if screenWidth > 700 && screenHeight > 1000 {
            nextKeyboardButton.frame = CGRect(x: 0, y: 0, width: screenWidth*0.1, height: screenWidth*0.1)
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
        caseButton.button.setTitle("1/2", forState: .Normal)
        caseButton.button.setImage(nil, forState: .Normal)
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