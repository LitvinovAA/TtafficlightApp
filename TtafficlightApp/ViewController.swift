//
//  ViewController.swift
//  TtafficlightApp
//
//  Created by Alexey on 22.07.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var ruleButton: UIButton!
    
    private var color: TrafficLightColor?
    private let turnOnAlpha = 1.0
    private let turnOffAlpha = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ruleButton.layer.cornerRadius = 10
 
        setColor(to: color)
    }

    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2

    }
    private func setColor(to color: TrafficLightColor?) {
        
        redView.alpha = color == .red ? turnOnAlpha : turnOffAlpha
        yellowView.alpha = color == .yellow ? turnOnAlpha : turnOffAlpha
        greenView.alpha = color == .green ? turnOnAlpha : turnOffAlpha

    }

    @IBAction func ruleButtonDidTapped() {
        if ruleButton.currentTitle == "START" {
            ruleButton.setTitle("NEXT" , for: .normal)
        }            
        color == nil ? color = .red : color?.toggle()
         
        setColor(to: color)
        
    }
}

private enum TrafficLightColor {
    case red
    case yellow
    case green
    
    mutating func toggle() {
        switch self {
        case .red:
            self = .yellow
        case .yellow:
            self = .green
        case .green:
            self = .red
        }
    }
}
