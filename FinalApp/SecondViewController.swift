//
//  SecondViewController.swift
//  FinalApp
//
//  Created by Shamsa Mohamed on 4/11/23.
//

import UIKit

class SecondViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var choosen = 0

    
    @IBOutlet weak var imageL: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func tapGest(_ sender: UITapGestureRecognizer) {
        alert()
    }
    
    func alert(){
        let alertController = UIAlertController(title: "Add Photo", message: nil, preferredStyle: .alert)
        let leftSide = UIAlertAction(title: "Camera", style: .default) {
            (action: UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        let rightSide = UIAlertAction(title: "Photo Library", style: .default) {
            (action: UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        alertController.addAction(leftSide)
        alertController.addAction(rightSide)
        self.present(alertController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        let imageName = UUID().uuidString
        let imagepath = getDocumentDirectory().appendingPathComponent(imageName)
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagepath)
        }
        switch choosen{
        case 0:
            imageL.image = image
        default:
            print("hi")
        }
        dismiss(animated: true)
    }
    func getDocumentDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
      
    }
}
