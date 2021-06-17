//
//  TestViewController.swift
//  Custom-Memory
//
//  Created by Dylan  Nierop on 07/06/2021.
//  Copyright © 2021 Christopher Ching. All rights reserved.
//

import UIKit

class CustomImagesController: UIViewController{
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var CustomImages: UIView!
    
    @IBAction func didTapButton(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
            
        
    }
}
extension CustomImagesController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            imageView.image = image
            }
        picker.dismiss(animated: true, completion: nil)
            
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

