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
    
    var viewModel: DetailVideoViewModel
    
    init(viewModel: DetailVideoViewModel) {
        self.viewModel = viewModel
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
        setupData()
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
    
    func setupData() {
        title = viewModel.data.name
        let url = viewModel.data.pictures?.baseLink ?? ""
        thumbnailImageView.sd_setImage(with: URL(string: url),
                                       placeholderImage: Images.namavaLogo.image)
        descriptionLabel.text = viewModel.data.description
        playCountButton.setTitle("0", for: .normal)
        let likeCount = viewModel.data.metadata?.connections?.likes?.total ?? 0
        likeCountButton.setTitle(String(likeCount), for: .normal)
        let commentCount = viewModel.data.metadata?.connections?.comments?.total ?? 0
        commentCountButton.setTitle(String(commentCount), for: .normal)
    }

    @IBAction func playButtonPressed(_ sender: Any) {
        let playVideoViewModel = PlayVideoViewModel(url: viewModel.data.playerEmbedURL ?? "")
        let vc = PlayVideoViewController(viewModel: playVideoViewModel)
        vc.title = viewModel.data.name
        navigationController?.pushViewController(vc, animated: true)
    }
}
