//
//  RegisterViewController.swift
//  ZoneZero
//
//  Created by Bilgihan Köse on 24.09.2020.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var lengthCount: Int?
    
    //MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        initializeHideKeyboard()
        
    }
    
    //MARK: - Functions
    
    func configure(){
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repasswordTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -258 // Move view upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        if (lengthCount ?? 0 >= 3 && passwordTextField.text == repasswordTextField.text) {
            let loginVC = storyboard?.instantiateViewController(identifier: "loginVC") as! LoginViewController
            loginVC.name = nameTextField.text!
            loginVC.password = passwordTextField.text!
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true)
        } else  {
            let alert = UIAlertController(title: "Invalid ", message: "Please enter at least 3 characters. Please double-check your password and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            hapticFeedback()
        }
    }
    
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
    
}


