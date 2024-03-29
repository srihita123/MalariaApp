//
//  FifthViewController.swift
//  MalariaApp
//
//  Created by Srihita on 4/16/22.
//

import UIKit
import CoreML
import Vision

class FifthViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    /* 2. Declare variables for our views */
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UILabel!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        /* 4. Handle image picker */
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        self.textView.text = ""
    }

    /* 6. Link detect function to the image picker controller */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("Cannot convert to CIImage.")
            }
            detect(image: ciImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    /* 5. Declare a function for image classification */
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: MalariaClassifer().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            if let firstResult = results.first {
                self.textView.text = firstResult.identifier.capitalized
            }
        }
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
    }

    /* 3. Show image picker when the camera button is pressed */
    @IBAction func cameraTapped(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//           let cameraView = UIImagePickerController()
//           cameraView.delegate = self as?
//               UIImagePickerControllerDelegate &
//               UINavigationControllerDelegate
//           cameraView.sourceType = .camera
//           self.present(cameraView, animated: true, completion: nil)
//       }

    }
}

