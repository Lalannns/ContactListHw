//
//  ViewController.swift
//  contact list hw
//
//  Created by Allan Auezkhan on 07.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var TextField1: UITextField!
    
    @IBOutlet weak var TextField2: UITextField!
    
    @IBOutlet weak var TextField3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: Any) {
        
        let name  = TextField1.text!
        
        let surname  = TextField2.text!
        
        let number  = TextField3.text!
        
        let newContact = Person(name:name,surname:surname, phoneNumber: number,isCompleted: false)
        
        
        
        
        do {
            if let data = UserDefaults.standard.data (forKey: "taskItemArray") {
                
                var array = try JSONDecoder().decode([Person].self, from: data)
                
                array.append (newContact)
                
                let encodedata = try JSONEncoder() .encode (array)
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            } else {
                
                let encodedata = try JSONEncoder().encode ([newContact])
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
                }
    } catch {
        print("unable to encode \(error)")
    }

        
        
    //        if let taskArray = UserDefaults.standard.array(forKey: "taskArray") as? [String] {
    //            var array = taskArray
    //
    //            array.append(task)
    //
    //            UserDefaults.standard.setValue(array, forKey: "taskArray")
    //
    //        }   else{
    //            UserDefaults.standard.setValue([task], forKey: "taskArray")
    //        }
        
        
        
        
        
        TextField1.text = ""
        
        TextField2.text = ""
        
        TextField3.text = ""
        
    }
    
}






