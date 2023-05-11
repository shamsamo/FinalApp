//
//  PersitViewController.swift
//  FinalApp
//
//  Created by Shamsa Mohamed on 4/24/23.
//

import UIKit

class PersitViewController: UIViewController {
    var arrayOfClasses: [PhotoDesc] = []
    var iholdJSONdata = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let defaults = UserDefaults.standard
                if let storedSample = defaults.data(forKey: "jsonData") {
                   iholdJSONdata = storedSample
                    dec()
                } else {

                    arrayOfClasses = [s1,s2]
                    print("defaults loaded")
                    
                }
        print("Instances of array: \(arrayOfClasses.count)")

    }

    @IBAction func tap(_ sender: Any) {
        // tap button to add another sample to the classes array.
//        arrayOfClasses.append(PhotoDesc(imageName: "penny", imageDesc: "1c"))
        // init JSON Encoder
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        // turn array of classes into JSON
        let data = try! encoder.encode(arrayOfClasses)
        // move data to top level variable
        iholdJSONdata = data
        //save JSON to user defaults
        let defaults = UserDefaults.standard
        defaults.set(iholdJSONdata, forKey: "jsonData")
        
       // print(arrayOfClasses)
        print("Instances of array: \(arrayOfClasses.count)")
        for i in arrayOfClasses{
            print(i.imageName)
        }
       
        

        
    }
    
    func enc(){
        let encoder = JSONEncoder()
        arrayOfClasses.append(s1)
        print(arrayOfClasses)
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(arrayOfClasses)
        print(String(data: data, encoding: .utf8)!) // use to print and test json data.
        iholdJSONdata = data
    }
    func dec(){
        let decoder = JSONDecoder()
        let this = try! decoder.decode([PhotoDesc].self, from: iholdJSONdata)
        arrayOfClasses = this
        print(arrayOfClasses)
        
        
    }
    
}


