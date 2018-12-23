//
//  Predictions.swift
//  RoomDetector
//
//  
//

import Foundation
import ARKit
import CoreML
import Vision

class Predictions {
    
    static func FromMultiDimensionalArrays(observations: [VNCoreMLFeatureValueObservation]?, nmsThreshold: Float = 0.5) -> [Prediction]? {
        guard let results = observations else {
            return nil
        }
        
        let coordinates = results[0].featureValue.multiArrayValue!
        let confidence = results[1].featureValue.multiArrayValue!
        let confidenceThreshold = 0.002
        var unorderedPredictions = [Prediction]()
        let numBoundingBoxes = confidence.shape[0].intValue
        let numClasses = confidence.shape[1].intValue
        let confidencePointer = UnsafeMutablePointer<Double>(OpaquePointer(confidence.dataPointer))
        let coordinatesPointer = UnsafeMutablePointer<Double>(OpaquePointer(coordinates.dataPointer))
        var predictions: [Prediction] = []

        
            for b in 0..<numBoundingBoxes {
                let x = coordinatesPointer[b * 4]
                let y = coordinatesPointer[b * 4 + 1]
                let w = coordinatesPointer[b * 4 + 2]
                let h = coordinatesPointer[b * 4 + 3]
                var maxConfidence = 0.0
                var maxIndex = 0
                
                for c in 0..<numClasses {
                    let conf = confidencePointer[b * numClasses + c]
                        if conf > maxConfidence {
                            maxConfidence = conf
                            maxIndex = c
                        }
                }

                if maxConfidence > confidenceThreshold {
                    let rect = CGRect(x: CGFloat(y - h / 2), y: CGFloat(x - w / 2), width: CGFloat(h), height: CGFloat(w))
                    
                    let prediction = Prediction(labelIndex: maxIndex,
                                                confidence: Float(maxConfidence),
                                                boundingBox: rect)
                                                unorderedPredictions.append(prediction)
                }
            }
       
        
        let orderedPredictions = unorderedPredictions.sorted {
            $0.confidence > $1.confidence
        }
        let numberOfOrderedPredictions = orderedPredictions.count
        var keep = [Bool](repeating: true, count: numberOfOrderedPredictions)
        
        for i in 0..<numberOfOrderedPredictions {
            if keep[i] {
                predictions.append(orderedPredictions[i])
                let bbox1 = orderedPredictions[i].boundingBox
                for j in (i + 1)..<numberOfOrderedPredictions {
                    if keep[j] {
                        let bbox2 = orderedPredictions[j].boundingBox
                        if IoU(bbox1, bbox2) > nmsThreshold {
                            keep[j] = false
                        }
                    }
                }
            }
        }
        return predictions
    }

    static public func IoU(_ a: CGRect, _ b: CGRect) -> Float {
        let intersection = a.intersection(b)
        let union = a.union(b)
        return Float((intersection.width * intersection.height) / (union.width * union.height))
    }

    struct Prediction {
        let labelIndex: Int
        let confidence: Float
        let boundingBox: CGRect
    }
}
