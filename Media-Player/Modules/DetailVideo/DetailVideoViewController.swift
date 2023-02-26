//
//  DetailVideoViewController.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import UIKit

class DetailVideoViewController: BaseViewController {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playCountButton: UIButton!
    @IBOutlet weak var likeCountButton: UIButton!
    @IBOutlet weak var commentCountButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    init() {
        super.init(nibName: DetailVideoViewController.nameOfClass, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
        setupFont()
        setupUI()
    }
    
    func setupColor() {
        descriptionLabel.textColor = UIColor.label
    }
    
    func setupFont() {
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    func setupUI() {
        thumbnailImageView.layer.cornerRadius = BorderStyles.defaultCornerRadius.rawValue
    }

    @IBAction func playButtonPressed(_ sender: Any) {
        
    }
}
