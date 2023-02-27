//
//  BaseViewController.swift
//
//  Created by Amir
//

import UIKit

class BaseViewController: UIViewController {
    let defaults = UserDefaults.standard
    lazy var validOrientation: UIInterfaceOrientationMask = .portrait
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setLandScape() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myOrientation = .landscapeRight
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        UIView.setAnimationsEnabled(true)
    }
    
    func setPortrait() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myOrientation = .portrait
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        UIView.setAnimationsEnabled(true)
    }
}

