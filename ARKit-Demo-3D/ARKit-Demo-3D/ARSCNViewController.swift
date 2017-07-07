//
//  ARSCNViewController.swift
//  ARKit-Demo-3D
//
//  Created by yesway on 2017/7/7.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit
import SceneKit
import ARKit


class ARSCNViewController: UIViewController {
    
    private lazy var arSCNView: ARSCNView = {
        let scnView = ARSCNView()
        scnView.session = self.arSession
        scnView.automaticallyUpdatesLighting = true
        scnView.showsStatistics = true
        scnView.translatesAutoresizingMaskIntoConstraints = false
        return scnView
    }()
    
    private lazy var arSession = { () -> ARSession in
        let session = ARSession()
        return session
    }()
    
    private lazy var arSessionConfiguration = { () -> ARWorldTrackingSessionConfiguration in
        let config = ARWorldTrackingSessionConfiguration()
        config.planeDetection = .horizontal
        config.isLightEstimationEnabled = true
        return config
    }()
    
    var planeNode: SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(arSCNView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arSession.run(arSessionConfiguration)
        
        arSession.delegate = self
        arSCNView.delegate = self
        
        NSLayoutConstraint.activate([
            arSCNView.topAnchor.constraint(equalTo: view.topAnchor),
            arSCNView.leftAnchor.constraint(equalTo: view.leftAnchor),
            arSCNView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            arSCNView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        arSession.delegate = nil
//        arSCNView.delegate = nil
        
        
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let shipScene = SCNScene(named: "Models.scnassets/candle/candle.scn")
//
//        let shipNode = shipScene?.rootNode.childNodes.first
//        shipNode?.position = SCNVector3Make(0, -0.2, -0.2)
//        arSCNView.scene.rootNode.addChildNode(shipNode!)
//
//        let cupScene = SCNScene(named: "Models.scnassets/cup/cup.scn")
//
//        let cupNode = cupScene?.rootNode.childNodes.first
//        cupNode?.position = SCNVector3Make(0, -0.2, -0.3)
//        arSCNView.scene.rootNode.addChildNode(cupNode!)
//    }
    private func creatFocusSquarePlane() -> SCNNode? {
        if planeNode == nil {
            let plane = SCNBox(width: 0.3, height: 0, length: 0.3, chamferRadius: 0)
            plane.firstMaterial?.diffuse.contents = UIColor.red
            planeNode = SCNNode(geometry: plane)
            planeNode?.position = SCNVector3Make(0, 0, 0)
        }
        return planeNode
    }
    
    deinit {
        print("deinit")
    }
}
extension ARSCNViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
//        let node = renderer.scene?.rootNode
//        guard let planeNode = creatFocusSquarePlane() else {
//            return
//        }
//        print(node?.childNodes.count ?? 0)
//        node?.addChildNode(planeNode)
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        print("find Node")
    }
    
    //刷新时调用
    func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        print("will Update")
    }
    //更新节点时调用
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        print("did Update Node")
    }
    
    //移除节点时调用
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        print("did Remove")
    }
}
extension ARSCNViewController: ARSessionDelegate {
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
//        print("相机移动")
    }
}
