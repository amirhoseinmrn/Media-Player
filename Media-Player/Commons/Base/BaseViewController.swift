//
//  BaseViewController.swift
//
//  Created by Amir
//

import UIKit

class BaseViewController: UIViewController {
    let defaults = UserDefaults.standard
    //    let loader = Loader.getLoader(text: "")
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        let titleLocalize = NSLocalizedString("Done", comment: "")
        alert.addAction(UIAlertAction(title: titleLocalize, style: .cancel))
        
        present(alert, animated: true, completion: nil)
    }
    
    public func handleError(_ error: Error, isLogin: Bool = false) {
        let errorModel = (error as NSError)
        var err = errorModel.domain
        
        if !Connectivity.isConnectedToInternet() {
            err = NSLocalizedString("Please check your connection...",
                                    comment: "")
        }
        
        let alert = UIAlertController(
            title: "Error",
            message: err,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: {(_: UIAlertAction!) in
            if errorModel.code == 401 && !isLogin {
                print("Change your access token")
            }
        }))
        
        present(alert, animated: true, completion: nil)
    }
}

