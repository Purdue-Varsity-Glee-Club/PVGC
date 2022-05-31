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
    let user  = PFUser();
    var found = 0

    

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
        // PASSWORD VALIDATION TEMPORARILY DISABLED!!!!!
        // Password must contain a minimum of eight characters, at least one letter, one number and one special character:
        
//        let range = NSRange(location: 0, length: password.utf16.count)
//        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$")
//        if(regex.firstMatch(in: password, options: [], range: range) != nil){
            return true
//        }
//        return false
    }


    func validateEmailAddress(email:String, completion:@escaping(Bool)->Void){
        
        //Check if student owns a purdue email
        var found = false
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try! NSRegularExpression(pattern: "^[a-z0-9](\\.?[a-z0-9]){5,}@purdue\\.edu$")
        if(regex.firstMatch(in: email, options: [], range: range) != nil){
            let query = PFQuery(className: "Members")
            query.whereKey("email", contains: emailTextField.text)
            query.findObjectsInBackground{(member:[PFObject]?, error) in
                if(member == nil){
                    print(error?.localizedDescription ?? "Something went wrong")
                    completion(found)
                }else{
                    found = true
                    let fullname = (member![0]["name"] as! String).components(separatedBy: " ")
                    self.user.username = (member![0]["email"] as! String).components(separatedBy: "@")[0]
                    self.user["firstname"] = fullname[0]
                    self.user["lastname"] = fullname[1]
                    self.user["role"] = member![0]["role"] as! String
                    completion(found)
                }
            }
        }else{
            completion(false)
        }
    }
    
    
    @IBAction func onRegisterButton(_ sender: Any) {
        validateEmailAddress(email: emailTextField.text!, completion: { (success) -> Void in
            if(success == true){
                self.user.email = self.emailTextField.text;
                if(self.validatePassword(password: self.passwordField1.text!) && self.passwordField1.text == self.passwordField2.text){
            
                    self.user.password = self.passwordField1.text;
                    self.user.signUpInBackground { (success, error) in
                        if(success){
                            print("Signup successful")
                            self.performSegue(withIdentifier: "registeredSegue", sender: nil)
                        } else if((error) != nil){
                            print(error?.localizedDescription ?? "Signup failed")
                        }
                    }
                }else{
                    print("Invalid Password");
                    return;
                }
            }else{
                print("Error")
            }
            
        })
    
        
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
