//
//  ARkitController.swift
//  RoomDetector
//
//  Created by Peter Shaburov on 10/07/18.
//  Copyright © 2018 MELScience. All rights reserved.
//

import Foundation
import UIKit
import CoreML
import ARKit
import Vision
import ImageIO

var coding = 0

class ARkitController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    private var melCodeReader: MELCodeReader? = nil
    private var melCodeBuffer: CVPixelBuffer? = nil
    private var requests = [VNRequest]()
    private lazy var classifier: Painting = Painting()
    private var startTime: TimeInterval?
    private var interval: TimeInterval = 2.0 //Figure out what this does
    private let configuration = ARWorldTrackingConfiguration()
    var MelBox = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 1920 , height: 1080))


    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAndAddVision()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeRequests()
    }

    private func initUI() {
        sceneView.antialiasingMode = .multisampling4X
        sceneView.session.run(configuration, options: ARSession.RunOptions.resetTracking)
        sceneView.preferredFramesPerSecond = 60
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
    }


    func setupAndAddVision() {
        guard let visionModel = try? VNCoreMLModel(for: classifier.model) else { fatalError("Can’t load VisionML model")}
        
        let classificationRequest = VNCoreMLRequest(model: visionModel, completionHandler: handleDetections)
        classificationRequest.imageCropAndScaleOption = VNImageCropAndScaleOption.scaleFill
        requests = [classificationRequest]
    }

    func removeRequests() {
        requests.removeAll()
    }
    
    func handleDetections(request: VNRequest, error: Error?) {
        if let _ = error { return }
        DispatchQueue.main.async {
            self.checkAndMakeView()
        }
    }

    private func checkAndMakeView() {
        if coding != 0 {
            let newXYZ = ARWorldTrackingConfiguration()
            self.sceneView.session.run(newXYZ, options: .resetTracking)
            let roomView = RoomView(sceneView: sceneView)
            roomView.setup(sceneView: sceneView)
            removeRequests()
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if startTime == nil { startTime = time }
        
        if time - startTime! > interval {
            startTime = time
            DispatchQueue.main.async {
                self.executeTheRequest()
            }
        }
    }

    func runMelCode(pixbuff: CVPixelBuffer? ) -> [MELCode] {
        let resoultion = CGSize(width: CVPixelBufferGetWidth(pixbuff!), height: CVPixelBufferGetHeight(pixbuff!))
        if melCodeReader == nil {
            melCodeReader = MELCodeReader(imageSize: resoultion)
        }
        
        CVPixelBufferLockBaseAddress(pixbuff!, CVPixelBufferLockFlags(rawValue: 0))
        let bytesPerRow = CVPixelBufferGetBytesPerRow(pixbuff!)
        let height = CVPixelBufferGetHeight(pixbuff!)
        let srcBuff = CVPixelBufferGetBaseAddress(pixbuff!)
        let data = NSData(bytes: srcBuff, length: bytesPerRow * height) as Data
        CVPixelBufferUnlockBaseAddress(pixbuff!, CVPixelBufferLockFlags(rawValue: 0))
        
        return melCodeReader!.readCodes(imageData: data, rect: MelBox)
    }

    func updateUI(codes: [MELCode]) {
        if codes.count != 0 {
            coding = codes.first!
        }
    }

    private func executeTheRequest() {
        let pixbuff : CVPixelBuffer? = (sceneView.session.currentFrame?.capturedImage)
        if pixbuff == nil { return }
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixbuff!, orientation: CGImagePropertyOrientation.right, options: [:])
        do {
            if requests.count > 0 {
                try imageRequestHandler.perform(self.requests)
            }
        } catch {
            print(error)
        }
        updateUI(codes: runMelCode(pixbuff: pixbuff))
    }
}



