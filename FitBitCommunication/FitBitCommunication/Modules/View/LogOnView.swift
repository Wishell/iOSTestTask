//  
//  LogOnView.swift
//  FitBitCommunication
//
//  Created by Wishell on 05.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import AudioToolbox

protocol LogOnViewInput: class {
    func configure(available: Bool)
    var textChange: ((String, Int)->Void)? {get set}
    var action: (()->Void)? {get set}
    func shaking(fields: [Int])
    
}

final class LogOnView: UIView {

    //MARK: = Outlets
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func OnLoginTouchDown(_ sender: Any) {
        self.login.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }
    
    @IBAction func OnLoginTouchUp(_ sender: Any) {
        self.login.transform = .identity
        action?()
    }
    
    var textChange: ((String, Int)->Void)?
    var action: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

// MARK: - LogOnViewInput
extension LogOnView: LogOnViewInput {
    
    func configure(available: Bool) {
        login.isEnabled = available
    }
    
    func shaking(fields: [Int]) {
        fields.forEach {
            if let textField = viewWithTag($0), textField is UITextField {
                UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [.autoreverse], animations: {
                    textField.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    //textField.frame = textField.frame.offsetBy(dx: 20, dy: 0)
                    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
                }, completion: { (finish) in
                    textField.transform = .identity
                    //textField.frame = textField.frame.offsetBy(dx: -20, dy: 0)
                })
            }
        }
    }
    
    //MARK - Hide Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        endEditing(true)
    }
    
}

//MARK - UITextFieldDelegate
extension LogOnView : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            textChange?("", textField.tag)
            return false}
        let textRange = Range(range, in: text)
        let updateText = text.replacingCharacters(in: textRange!, with: string)
        textChange?(updateText, textField.tag)
        return true
    }


    
}
