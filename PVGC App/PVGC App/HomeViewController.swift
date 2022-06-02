//
//  HomeViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 6/1/22.
//

import UIKit
import Parse


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(user?.allKeys)
        

        // Do any additional setup after loading the view.
    }
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        self.dismiss(animated: true, completion: nil)
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
