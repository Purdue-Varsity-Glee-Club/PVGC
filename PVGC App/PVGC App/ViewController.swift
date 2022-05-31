//
//  ViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/18/22.
//

import UIKit
import Parse

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        if (PFUser.current() != nil){
//            self.performSegue(withIdentifier: "loginSegue", sender: self)
//        }
//    }


    @IBAction func onLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordField.text!) { (user, error) in
            if(user != nil){
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print(error?.localizedDescription)
            }
        }
    }
}

