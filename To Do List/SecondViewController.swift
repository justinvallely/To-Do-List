//
//  SecondViewController.swift
//  To Do List
//
//  Created by Justin Vallely on 5/18/15.
//  Copyright (c) 2015 JMVapps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        // Append the item to the global array
        toDoList.append(item.text)
        
        // Save the array into permanent storage
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
        // Clear the text input field
        item.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // View controller is responsible for the text field
        self.item.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Tap outside of the keyboard to close keyboard
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    // Close keyboard when Return key is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        item.resignFirstResponder()
        return true
    }
}

