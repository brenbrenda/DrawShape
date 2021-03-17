//
//  ContentView.swift
//  DrawShape
//
//  Created by chia on 2021/3/14.
//

import SwiftUI
import UIKit
import AVKit

struct DrawView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {

        let view = UIView()
        let path = UIBezierPath(ovalIn: CGRect(x: 165, y: -1, width: 95, height: 70))
        //eye
        path.move(to: CGPoint(x: 193, y: 35))
        path.addArc(withCenter: CGPoint(x: 190, y: 35), radius: 3, startAngle: 0, endAngle: 360, clockwise: true)
        path.move(to: CGPoint(x: 193, y: 35))
        path.addLine(to: CGPoint(x: 215, y: 35))
            
        //body and arm
        path.move(to: CGPoint(x:173, y: 61))
        path.addQuadCurve(to: CGPoint(x: 140, y: 90), controlPoint: CGPoint(x: 149, y: 60))
        path.addQuadCurve(to: CGPoint(x: 55, y: 232), controlPoint: CGPoint(x: 55, y: 157))
        path.addCurve(to: CGPoint(x: 60, y: 372), controlPoint1: CGPoint(x: 38, y: 290), controlPoint2: CGPoint(x: 42, y: 339))
        
        //hands
        path.addLine(to: CGPoint(x: 63, y: 373))
        path.addQuadCurve(to: CGPoint(x: 80, y: 385), controlPoint: CGPoint(x: 76, y: 391))
        path.addCurve(to: CGPoint(x: 90, y: 373), controlPoint1: CGPoint(x: 81, y: 387), controlPoint2: CGPoint(x: 83, y: 383))
        path.addCurve(to: CGPoint(x: 90, y: 360), controlPoint1: CGPoint(x: 90, y: 373), controlPoint2: CGPoint(x: 100, y: 367))
       path.addQuadCurve(to: CGPoint(x: 98, y: 345), controlPoint: CGPoint(x: 100, y: 343))
        
        //body
        path.move(to: CGPoint(x:140, y: 90))
        path.addQuadCurve(to: CGPoint(x: 102, y: 232), controlPoint: CGPoint(x: 102, y: 157))
        path.addQuadCurve(to: CGPoint(x: 210, y: 430), controlPoint: CGPoint(x: 60, y: 399))

        //feet
        path.addLine(to: CGPoint(x:210, y: 480))
        path.addCurve(to: CGPoint(x:153, y: 480), controlPoint1: CGPoint(x:198, y: 500), controlPoint2: CGPoint(x:155, y: 490))
        path.addQuadCurve(to: CGPoint(x:145, y: 410), controlPoint: CGPoint(x:140, y: 450))
        //symmetry path
        let rlayer = CAShapeLayer()
        rlayer.path = path.cgPath
        rlayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.6)
        rlayer.lineWidth = 4
        view.layer.addSublayer(rlayer)
        rlayer.fillColor = UIColor.clear.cgColor
        let leftLayer = CAShapeLayer()
        leftLayer.path = path.cgPath
        let moveDistance = path.bounds.maxX + path.bounds.width - path.bounds.minX - 7
        leftLayer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1).concatenating(CGAffineTransform(translationX: moveDistance, y: 0)))
        leftLayer.fillColor = UIColor.clear.cgColor
        leftLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.6)
        leftLayer.lineWidth = 4
        view.layer.addSublayer(leftLayer)
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Image("disney")
                .mask(Text("BIG HERO 6"))
                .frame(width: 300, height: 35, alignment: .center)
            player()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            DrawView()
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct player: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let url = "http://movietrailers.apple.com/movies/disney/bighero6/bighero6-tlr2_h480p.mov"
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
        
    }
}
