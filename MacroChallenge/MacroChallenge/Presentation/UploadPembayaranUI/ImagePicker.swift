//
//  ImagePicker.swift
//  MacroChallenge
//
//  Created by Dickie Mandela on 11/11/20.
//

import Foundation
import UIKit

public protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage?, localPath: String?)
}

open class ImagePicker: NSObject {

    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?

    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()

        super.init()

        self.presentationController = presentationController
        self.delegate = delegate

        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }

    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }

        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }

    public func present(from sourceView: UIView) {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        if let action = self.action(for: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }

        self.presentationController?.present(alertController, animated: true)
    }

    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?, path: String?) {
        controller.dismiss(animated: true, completion: nil)

        self.delegate?.didSelect(image: image, localPath: path)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil, path: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let imageURL = info[UIImagePickerController.InfoKey.referenceURL] as? URL else {return}
        
        let imageName = imageURL.lastPathComponent
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String
        let localPath = documentDirectory.appending(imageName)
        
        
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil, path: nil)
        }
        self.pickerController(picker, didSelect: image, path: localPath)
        
//        let data = image.pngData()
//        let localPathUrl = NSURL(string: localPath)!
//        do {
//            try data?.write(to: localPathUrl as URL)
//        } catch let error {
//            print(error)
//        }
//
//
//        let imageData = NSData(contentsOfFile: localPath)!
//        let photoURL = NSURL(fileURLWithPath: localPath)
////        let imageWithData = UIImage(data: imageData)!
//
//        self.pickerController(picker, didSelect: image, path: photoURL)
    }
}

extension ImagePicker: UINavigationControllerDelegate {

}
