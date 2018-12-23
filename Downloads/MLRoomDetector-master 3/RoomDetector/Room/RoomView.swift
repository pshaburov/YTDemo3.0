//
//  RoomDetail.swift
//

//

import Foundation
import ARKit

class RoomView {
    private var sceneView: ARSCNView
    private let defaultRoom = "Bottle"

    init(sceneView: ARSCNView) {
        self.sceneView = sceneView
    }

    func setup(sceneView: ARSCNView) {
        let titleNode = self.addTitleAndDesc(text: defaultRoom, sceneView: sceneView)
        self.addImageNode(sceneView: sceneView, titleNode: titleNode)
    }

    private func addTitleAndDesc(text:String, sceneView: ARSCNView) -> TextNode
        {
            let textScn = ARText(text: text, font: UIFont .systemFont(ofSize: CGFloat(5)), color: UIColor.white, depth: CGFloat(0.0))
            let textNode = TextNode(distance: Float(1.5), scntext: textScn, sceneView: sceneView, scale: 1 / 200.0, type: TextType.Title)
            sceneView.scene.rootNode.addChildNode(textNode)
            return textNode
        }

    public func addBox(sceneView: ARSCNView) {
        let codeToString = "art.scnassets/" + String(coding) + ".scn"
        let codeToName = String(coding) + ".scn"
        let confetti = SCNParticleSystem(named: "Explode", inDirectory: nil)
        let imagePlaneScene = SCNScene(named: codeToString)
        let imagePlaneNode = imagePlaneScene?.rootNode.childNode(withName: codeToName, recursively: true)
            imagePlaneNode?.position = positioner
            imagePlaneNode?.addParticleSystem(confetti!)
            sceneView.scene.rootNode.addChildNode(imagePlaneNode!)
    }

    private func addImageNode(sceneView: ARSCNView, titleNode: TextNode) {
        addBox(sceneView: sceneView)
    }
}

class RoomDetail:NSObject {
    
    public var roomName = ""
    public static let rooms = ["Bottle"]

    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {}
    
    init(name: String) {
        super.init()
        self.roomName = name
    }
}
