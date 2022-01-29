//
//  ARContentsViewController.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/29.
//

import UIKit
import SceneKit
import ARKit
import SwiftUI
import PinLayout

struct ARContentsViewContainer: UIViewControllerRepresentable {
    typealias UIViewControllerType = ARContentsViewController
    
    var attribute: ARContentsViewController.Attribute
    
    func makeUIViewController(context: Context) -> ARContentsViewController {
        let viewController: ARContentsViewController = .init(attribute: attribute)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ARContentsViewController, context: Context) {
        // update
    }
}

final class ARContentsViewController: UIViewController {
    private var sceneView: ARSCNView = .init()
    
    struct Attribute {
        var order: Int  // 何番目のマーカーか
        var resource: String // マーカーの画像URL
        var objectUrl: String // 表示するUSDZのURL
    }
    
    private var attribute: Attribute
    
    init(attribute: Attribute) {
        self.attribute = attribute
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEBUG")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: \(attribute)")
        arConfiguration(groupName: attribute.resource)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        sceneView.pin.all()
    }
    
    private func arConfiguration(groupName: String) {
        sceneView.delegate = self
        sceneView.scene = .init()
        
        let configuration: ARImageTrackingConfiguration = .init()
        configuration.trackingImages = ARReferenceImage.referenceImages(inGroupNamed: groupName, bundle: nil)!
        sceneView.session.run(configuration)
        view.addSubview(sceneView)
    }
}

extension ARContentsViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        do {
            let url = Bundle.main.url(forResource: attribute.objectUrl, withExtension: "usdz")!
            let scene = try SCNScene(url: url)
            let modelNode: SCNNode = .init()
            for childNode in scene.rootNode.childNodes {
                modelNode.addChildNode(childNode)
            }
            node.addChildNode(modelNode)
            print("DEBUG: \(node.childNodes.debugDescription)")
        } catch {
            print(error)
        }
    }
}
