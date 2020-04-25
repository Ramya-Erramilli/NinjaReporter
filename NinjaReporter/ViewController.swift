//
//  ViewController.swift
//  NinjaReporter
//
//  Created by Ramya Seshagiri on 20/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var occupationOutlet: UITextField!
    @IBOutlet weak var experienceOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func submitAction(_ sender: UIButton) {
    
        if let name = nameOutlet.text, let occ = occupationOutlet.text,let exp = experienceOutlet.text{
            realmWrite(name: name, occ: occ, exp: exp)
            
            let alert = UIAlertController(title: "Success", message: "Your ninja 🤺 \(name)  is succesfully registered!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (al) in
                
            
                
                self.navigationController?.popToRootViewController(animated: true)
                
            }))
            self.present(alert, animated: true) {
//                print("here")
//
//                var coll = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "collVC") as! CollectionViewController
//                coll.collectionView.reloadData()
//                self.present(coll, animated: true, completion: nil)
            }
        }else{
            
            let alert = UIAlertController(title: "Error", message: "Invalid entries", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func realmWrite(name:String,occ:String,exp:String){
        let realm = try! Realm()
        
        let ninjas = realm.objects(Ninja.self)
        
        var myNinja = Ninja()
        myNinja.name = name
        myNinja.experienc = occ
        myNinja.occupation = exp

        try! realm.write {
            realm.add(myNinja)
        }
        print(ninjas.count)
        
    }


}

