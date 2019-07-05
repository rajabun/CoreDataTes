//
//  ViewController.swift
//  CoreDataTes
//
//  Created by Muhammad Rajab Priharsanto on 05/07/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController
{
    @IBOutlet weak var namaTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var contactData: [Contact]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadItems()
    }
    
    @IBAction func addButton(_ sender: Any)
    {
        let data = Contact(context: context)
        data.nama = namaTF.text
        data.phoneNumber = phoneNumberTF.text
        
        //save data to array contactData
        contactData?.append(data)
        saveItems()
    }
    
    func saveItems()
    {
        do
        {
            try context.save()
        }
        catch
        {
            print("Error nih cuy", error)
        }
        
        updateLayout()
    }
    
    func loadItems()
    {
        let request : NSFetchRequest = Contact.fetchRequest()
        
        
        do
        {
            contactData = try context.fetch(request)
        }
        catch
        {
            print("Error", error)
        }
        
        
    }
    
    func updateLayout()
    {
        nameLabel.text = contactData?.last?.nama
        phoneNumberLabel.text = contactData?.last?.phoneNumber
    }
}

