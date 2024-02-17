//
//  ARViewUIKit.swift
//  MVVM
//
//  Created by Yasir Rifai on 2024-02-17.
//

import Foundation
import SwiftUI
import UIKit
import ARKit
import RealityKit

struct ARViewUIKit : UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let arView = ARView(frame: .zero)
        
        let anchro = AnchorEntity(.plane(.horizontal, classification: .floor, minimumBounds: .one))
        
        //let box = ModelEntity(mesh: .generateBox(size: 0.5), materials: [SimpleMaterial(color: .red, isMetallic: true)])
        
        //anchro.addChild(box)
        
        do {
           let model = try ModelEntity.load(named: "sophia")
            for anim in model.availableAnimations {
                model.playAnimation(anim.repeat(duration: .infinity),
                                    transitionDuration: 1.25, startsPaused: false
                )
            
            }
            
            anchro.addChild(model)
        }catch{
            
        }
        
        
        
        arView.scene.addAnchor(anchro)
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
