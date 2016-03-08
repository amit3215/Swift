//
//  LoginResone.swift
//  Swift_basic
//
//  Created by Amit kumar on 15/08/15.
//  Copyright © 2015 Amit kumar. All rights reserved.
//

import UIKit

class LoginResone: NSObject {
    
    var dateOfBirth :String
    var name : String = ""
    var gender : String = "Male"
    var email : String = ""

    
    init(dob : String) {
        self.dateOfBirth = dob
    }
    

}
