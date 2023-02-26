//
//  PlayVideoViewController.swift
//  Media-Player
//
//  Created by amir on 2/27/23.
//

import UIKit
import WebKit

class PlayVideoViewController: BaseViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var viewModel: PlayVideoViewModel
    lazy var validOrientation : UIInterfaceOrientationMask = UIInterfaceOrientationMask.portrait
    
    init(viewModel: PlayVideoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: PlayVideoViewController.nameOfClass, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadWebView()
        setLandScape()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setPortrait()
    }
    
    func setLandScape() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myOrientation = .landscapeRight
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        UIView.setAnimationsEnabled(true)
    }
    
    func setPortrait() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myOrientation = .allButUpsideDown
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        UIView.setAnimationsEnabled(true)
    }
    
    func setupUI() {
//        webView.backgroundColor = .systemBackground
    }
    
    func loadWebView() {
        if let url = URL(string: viewModel.url) {
            let request = URLRequest(url: url)
            DispatchQueue.main.async {
                self.webView.load(request)
            }
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
