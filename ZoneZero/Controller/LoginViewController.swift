//
//  LoginViewController.swift
//  ZoneZero
//
//  Created by Bilgihan Köse on 24.09.2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    var name = ""
    var password = ""
    var remindMeButtonUnchecked = true
    var promotionButtonUnchecked = true
    
    
    
    //MARK: -Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var hiddenLabel: UILabel!
    @IBOutlet weak var hiddenButton: UIButton!
    
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenLabel.isHidden = true
        hiddenButton.isHidden = true
        
        initializeHideKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
    }
    
    
    //MARK: - Functions
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -100 // Move view upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        if (nameTextField.text == name && passwordTextField.text == password) {
            let loginVC = storyboard?.instantiateViewController(identifier: "movieListVC") as! MovieListViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true)
            
        } else  {
            hapticFeedback()
            let alert = UIAlertController(title: "Invalid ", message: "Please double-check your name and password!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Retry", style: .destructive, handler: { [self] (UIAlertAction) in
                nameTextField.text = ""
                passwordTextField.text = ""
            }))
            self.present(alert, animated: true)
            
        }
    }
    
    
    @IBAction func remindMeButton(_ sender: UIButton) {
        
        if remindMeButtonUnchecked {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            remindMeButtonUnchecked = false
            hiddenLabel.isHidden = false
            hiddenButton.isHidden = false
        } else {
            sender.setImage( UIImage(systemName: "square"), for: .normal)
            remindMeButtonUnchecked = true
            hiddenLabel.isHidden = true
            hiddenButton.isHidden = true
        }
    }
    
    
    @IBAction  func promotionButton(_ sender: UIButton) {
        if promotionButtonUnchecked {
            sender.setImage( UIImage(systemName: "checkmark.square.fill"), for: .normal)
            promotionButtonUnchecked = false
        } else {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            promotionButtonUnchecked = true
        }
    }
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){  
        view.endEditing(true)
    }
}
