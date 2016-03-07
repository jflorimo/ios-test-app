//
//  ViewController.swift
//  swifty
//
//  Created by Jean-christophe FLORIMONT on 2/26/16.
//  Copyright © 2016 Jean-christophe FLORIMONT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions

    @IBAction func setLabelLogin(sender: UIButton) {
        loginLabel.text = "buenjour"
    }


}

