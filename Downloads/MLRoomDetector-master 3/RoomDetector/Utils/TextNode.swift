//
//  TextNode.swift
//
//

//  
//

import UIKit
import SceneKit
import ARKit

var positioner = SCNVector3(0, 0, 0)

class TextNode: SCNNode {
    
    var x = 0

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(distance:Float, scntext:SCNText, sceneView:ARSCNView, scale:CGFloat, type: TextType) {
        super.init()
        guard let pointOfView = sceneView.pointOfView else { return }
        
        let mat = pointOfView.transform
        let mat31 = -1 * (mat.m31), mat32 = -1 * (mat.m32), mat33 = -1 * (mat.m33)
        
        let dir = SCNVector3(mat31 / 5, mat32 / 5 + 0.05, mat33 / 5)
        let currentPosition = SCNVector3(mat31 / 4 - 0.03, mat32 / 4 + 0.09, mat33 / 5)
        
        self.position = currentPosition
        self.geometry = scntext
        self.scale = SCNVector3(scale, scale, scale)
        positioner = dir
        }
}


enum TextType {
    case Title
}

class ARText:SCNText {
    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    init(text:String, font:UIFont, color:UIColor, depth:CGFloat) {
        super.init()
        self.string = text
        self.extrusionDepth = depth
        self.font = font
        self.firstMaterial?.isDoubleSided = true
        self.firstMaterial!.diffuse.contents = color
    }
}

