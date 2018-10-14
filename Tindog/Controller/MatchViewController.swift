//
//  MatchViewController.swift
//  Tindog
//
//  Created by Felipe on 10/14/18.
//  Copyright © 2018 Platzi. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    @IBOutlet weak var copyMatchLbl: UILabel!
    @IBOutlet weak var firstUserMatch: UIImageView!
    @IBOutlet weak var secondUserMatch: UIImageView!
    @IBOutlet weak var doneBtn: UIButton!
    
    var currentUserProfile: UserModel?
    var currentMatch: MatchModel?
    
    
    
    @IBAction func dondeBtnAction(_ sender: Any) {
        if let currentMatch = currentMatch {
            if currentMatch.matchIsAccepted{
                
            }else{
                DataBaseService.instance.updateFirebaseDBMatch(uid: currentMatch.uid)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.secondUserMatch.roundImage()
        self.firstUserMatch.roundImage()
        if let match = self.currentMatch{
            print("match: \(match)")
            if let profile = self.currentUserProfile{
                var secondID: String = ""
                if profile.uid == match.uid{
                    secondID = match.uid2
                }else{
                    secondID = match.uid
                }
                DataBaseService.instance.getUserProfile(uid: secondID, handler: {(secondUser) in
                    if let secondUser = secondUser {
                        if profile.uid == match.uid{
                            // init match
                            self.firstUserMatch.sd_setImage(with: URL(string:profile.profileImage), completed: nil)
                            self.secondUserMatch.sd_setImage(with: URL(string:secondUser.profileImage), completed: nil)
                            self.copyMatchLbl.text = "Esperando a \(secondUser.displayName)"
                            self.doneBtn.alpha = 0
                        }else{
                            // match
                            self.firstUserMatch.sd_setImage(with: URL(string:secondUser.profileImage), completed: nil)
                            self.secondUserMatch.sd_setImage(with: URL(string:profile.profileImage), completed: nil)
                            self.copyMatchLbl.text = "Tu mascota le gusta a \(secondUser.displayName)"
                            self.doneBtn.alpha = 1
                        }
                    }
                })
                
                
            }
        }
        // Do any additional setup after loading the view.
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
