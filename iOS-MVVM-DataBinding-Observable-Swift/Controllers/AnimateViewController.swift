//
//  AnimateViewController.swift
//  iOS-MVVM-DataBinding-Observable-Swift
//
//  Created by Hemant Pandagre on 22/06/22.
//

import UIKit

class AnimateViewController: UIViewController {
    var viewmodel: AnimateBussinessLogic?
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load()
    }
    
    func load() {
        viewmodel = AnimateViewModel()
        
        // Implemented 'animationObservation' here for changing 'color' and showing 'number'
        viewmodel?.animationObservable.bind({ [weak self] (colorType, second) in
            self?.view.backgroundColor = colorType.color
            self?.lblCounter.text = second.description
        })
        
        // Implemented 'buttonObservable' here for showing 'Start' and 'Stop' title on the button
        viewmodel?.buttonObservable.bind({ [weak self] isStart in
            let title = isStart ? "Stop" : "Start"
            self?.playButton.setTitle(title, for: .normal)
        })
    }
    
    @IBAction func pressedPlayPauseButton(_ sender: UIButton) {
        viewmodel?.startStop()
    }
}
