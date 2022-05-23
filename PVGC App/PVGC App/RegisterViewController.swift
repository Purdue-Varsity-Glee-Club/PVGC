//
//  RegisterViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/19/22.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordField1: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var matchingError: UILabel!
    @IBOutlet weak var passwordField2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        matchingError.isHidden = true;
        // Do any additional setup after loading the view.
        
       
    }
    @IBAction func confirmingPassword(_ sender: Any) {
        if(passwordField2.text != passwordField1.text){
            matchingError.isHidden = false;
        }else{
            matchingError.isHidden = true;
        }
    }
    
    func validatePassword(password:String) -> Bool {
        
        // Password must contain a minimum of eight characters, at least one letter, one number and one special character:
        
        let range = NSRange(location: 0, length: password.utf16.count)
        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$")
        if(regex.firstMatch(in: password, options: [], range: range) != nil){
            return true
        }
        return false
    }
    
    func validateEmailAddress(email:String) -> Bool{
        
        //Check if student owns a purdue email
        
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try! NSRegularExpression(pattern: "^[a-z0-9](\\.?[a-z0-9]){5,}@purdue\\.edu$")
        if(regex.firstMatch(in: email, options: [], range: range) != nil){
            return true
        }
        return false
    }
    
    
    @IBAction func onRegisterButton(_ sender: Any) {
        let user  = PFUser();
        if(validateEmailAddress(email: emailTextField.text!)){
            user.email = emailTextField.text;
        }else{
            print("invalid email address");
            return;
        }
        
        if(validatePassword(password: passwordField1.text!) && passwordField1.text == passwordField2.text){
            user.password = passwordField1.text;
            user.signUpInBackground { (success, error) in
                if(success){
                    print("Signup successful")
                    self.performSegue(withIdentifier: "registeredSegue", sender: nil)
                } else if((error) != nil){
                    print(error?.localizedDescription)
                }
            }
        }else{
            print("Invalid Password");
            return;
        }
        
        
        
        
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
