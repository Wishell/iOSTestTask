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
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        DispatchQueue.main.async {
            let views = fields.compactMap { self.viewWithTag($0) as? UITextField }
            UIView.animate(withDuration: 0.2, animations: {
                views.forEach { $0.transform = CGAffineTransform(scaleX: 1.2, y: 1.2) }
            }, completion: { (finish) in
                UIView.animate(withDuration: 0.2, animations: {
                    views.forEach { $0.transform = .identity }
                })
            })
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
