//
//  ViewController.swift
//  Swift
//
//  Created by Amit kumar on 15/08/15.
//  Copyright © 2015 Amit kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func enterHell(sender: AnyObject) {
        
        
        
        
//        let url = NSURL(string:"http://web.chetu.com/skusuma-HC/Login.svc/Login/UserLoginForIPhone")
//        let cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
//        var request = NSMutableURLRequest(URL: url!, cachePolicy: cachePolicy, timeoutInterval: 720)
//        request.HTTPMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var dataString = [
            
            "loginEntity" : [
                
                "UserNameStr" : "amitphysician",
                "ClientRefIDInt" : "2",
                "PasswordStr" : "Chetu@123",
                "LocationIDInt" : "1"
                
            ]
        ]
        
        
        
        
        var error1: NSError?
        
        var theJSONText:NSString? = nil
        
        do{
            let json = try NSJSONSerialization.dataWithJSONObject(dataString, options: NSJSONWritingOptions.PrettyPrinted)
            
            
            theJSONText = NSString(data: json,
                encoding: NSUTF8StringEncoding)
            print("JSON string = \(theJSONText!)")
            
        }catch let error1 as NSError{
            
        }

        
//        let requestBodyData = theJSONText?.dataUsingEncoding(NSUTF8StringEncoding)
//        request.HTTPBody = requestBodyData
//
//        
//        var response: NSURLResponse? = nil
//        var error: NSError? = nil
//        
//        var reply:NSData? = nil
//        
//        do{
//            reply = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
//        }catch let error as NSError{
//            
//        }
//
//        let results = NSString(data:reply!, encoding:NSUTF8StringEncoding)
//        print("API Response: \(results)")
        

        
                let request = NSMutableURLRequest(URL: NSURL(string: "http://web.chetu.com/skusuma-HC/Login.svc/Login/UserLoginForIPhone")!)
                request.timeoutInterval = 720
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.HTTPMethod = "POST"
                request.HTTPBody = theJSONText?.dataUsingEncoding(NSUTF8StringEncoding)
                request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
        
        
                let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                    data, response, error in
        
                    if error != nil {
                        print("error=\(error)")
                        return
                    }
        
                    print("response = \(response)")
        
                    let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("New Response >>>>>>>>>>>>>>>>>>> = \(responseString)")
                    
                    
                   
                    let jsonError: NSError?
                    
//                    do{
//                        let decodedJson = NSJSONSerialization.JSONObjectWithData(data!, options: nil) as Dictionary<String, AnyObject>{
//                            return nil
//                        }
//                    }catch jsonError! as NSError{
//                        
//                    }
                    
                    
                    
//                    if !jsonError {
//                        println(decodedJson["title"])
//                    }
                  
                    
                    
                
                    
                    let loginUser = LoginResone.init(dob: "Amit")
                    
                    loginUser.name = "Kumar"
                    
                    print(loginUser.gender);

                    
                    
                }
                task!.resume()

        
        
        
                let  tableView:TableViewController = TableViewController()
        //        tableView.delete(self)
                self.showViewController(tableView, sender: sender);
        
    }
    
}

