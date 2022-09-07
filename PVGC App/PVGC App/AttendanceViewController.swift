//
//  AttendanceViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 6/6/22.
//

import UIKit
import Parse

class AttendanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.users!.count
        return self.users.count as Int;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attendanceCell") as! AttendanceCell
        //let user = self.users?[indexPath.row]
        let user = self.users[indexPath.row]
        cell.nameLabel.text = self.users[indexPath.row]["name"] as! String
        cell.event = event
        cell.user = self.users[indexPath.row]
        if(self.event?.attendance != nil){
            for currentUser in (self.event?.object!["attendance"] as! [PFObject]){
//                print("User \(user.objectId) -- CurrentUser \(currentUser.objectId)")
                if(currentUser.objectId == user.objectId){
                    cell.attendanceCheck.isOn = true
                }
            }
        }else{
            cell.attendanceCheck.isOn = false
        }
        
        return cell;
    }
    

    @IBOutlet weak var members: UITableView!
    @IBOutlet weak var searchField: UISearchBar!
    var users:[PFObject] = []
    var event:Event?
    var filteredUsers:[PFObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.delegate = self
        members.delegate = self
        members.dataSource = self
        loadAttendance()
    }
    
    func loadAttendance(){
        let query = PFQuery(className: "Members")
        query.includeKey("attendance")
        query.findObjectsInBackground{(users, error) in
            if(users == nil){
                print(error?.localizedDescription)
            }else{
                self.users = users! as [PFObject]
                self.filteredUsers = self.users
                self.members.reloadData()
            }
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (self.searchField.text!.count != 0){
            self.users = []
            self.users = findUsers(name: searchText)
        }else{
            self.users = self.filteredUsers
        }
        
        self.members.reloadData()
    }
    
    func findUsers(name:String)->[PFObject]{
        var newUsers:[PFObject] = []
        let temp = self.filteredUsers as [PFObject]
        for user in temp{
            let nameText = String.lowercased(name)()
            let fullname = String.lowercased(user["name"] as! String)
            if fullname().contains(nameText){
                newUsers.append(user)
            }
        }
        
        return newUsers
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
