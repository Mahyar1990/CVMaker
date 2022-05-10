//
//  ImagePickerManager.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class ImagePickerManager: NSObject {
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title:            Constants.Alert.chooseYourImageTitle,
                                  message:          nil,
                                  preferredStyle:   .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;
    
    override init(){
        super.init()
        let cameraAction = UIAlertAction(title: Constants.Alert.camera,
                                         style: .default) { UIAlertAction in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: Constants.Alert.gallery,
                                          style: .default) { UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: Constants.Alert.cancel,
                                         style: .cancel) { UIAlertAction in
        }
        
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
    }
    
}
