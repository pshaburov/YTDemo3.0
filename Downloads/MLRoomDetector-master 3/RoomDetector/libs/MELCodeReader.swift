import Foundation
import UIKit

typealias MELCode = Int

enum MELCodeType {
    case experiment
    case reagent
}

class MELCodeReader: MRLogger {
    
    private let imageProcessor: MRImageProcessor
    private let mapper = MELCodeMapper()
    
    init(imageSize: CGSize) {
        let options = MROptions.init(format: MRDataFormat.GRAY8,
                                     size: MRSize.init(width: Int32(imageSize.width),
                                                       height: Int32(imageSize.height)))
        imageProcessor = MRImageProcessor.create(options)!
        imageProcessor.setLogger(self)
    }
    
    func readCodes(imageData: Data, rect: CGRect) -> [MELCode] {
        var libCodes: [Int] = []

        let codes = imageProcessor.processSubFrame(
            imageData,
            topLeft: MRPoint(x: Float(rect.origin.x), y: Float(rect.origin.y)),
            size: MRSize(width: Int32(rect.size.width), height: Int32(rect.size.height)),
            extractAll: true)
        
        libCodes = (codes.map({ (code) -> Int in
            return Int(code.value)
        }))
        
        return libCodes.compactMap({ (libCode) -> MELCode? in
            return self.mapper.map(libMelCode: libCode)
        })
    }
    
    static func codeType(_ code: MELCode) -> MELCodeType {
        var type = MELCodeType.reagent
        if code >= 501 && code <= 800 {
            type = MELCodeType.experiment
        }
        
        return type
    }
    
    func d(_ id: String, s: String) {
        print(id + "   " + s)
    }
    
}
