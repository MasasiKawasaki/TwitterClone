//
//  ImagePicker.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/23.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var picker : Bool
    @Binding var picData : Data
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(parentMaster: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
        
        var parent : ImagePicker
        
        init(parentMaster : ImagePicker) {
            parent = parentMaster
            print("きた")
        }
        
        func ImagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.picker.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            let picData = image.jpegData(compressionQuality: 0.25)
            self.parent.picData = picData!
            self.parent.picker.toggle()
        }
    }
}
