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
        loadWebView()
        setLandScape()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setPortrait()
    }
    
    func loadWebView() {
        DispatchQueue.main.async {
            self.webView.loadHTMLString(self.viewModel.html, baseURL: nil)
        }
    }
}
