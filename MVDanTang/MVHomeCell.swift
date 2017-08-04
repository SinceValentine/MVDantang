//
//  MVHomeCell.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/8/4.
//  Copyright © 2017年 天景隆. All rights reserved.
//
// 主页cell
import UIKit
import Kingfisher

protocol MVHomeCellDelegate: NSObjectProtocol {
    func homeCellDidClickedFavoriteButton(button: UIButton)
}


class MVHomeCell: UITableViewCell {
    
    weak var delegate: MVHomeCellDelegate?
    
    @IBOutlet weak var placeholderBtn: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var bgImageView: UIImageView!
    
    var homeItem: MVHomeItem? {
        didSet {
            let url = homeItem!.cover_image_url
            bgImageView.kf.setImage(with: URL(string: url!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.isHidden = true
            }
            titleLabel.text = homeItem!.title
            favoriteBtn.setTitle("" + String(homeItem!.likes_count!), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteBtn.layer.cornerRadius = favoriteBtn.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.shouldRasterize = true
        favoriteBtn.layer.rasterizationScale = UIScreen.main.scale
        bgImageView.layer.cornerRadius = 5.0
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.main.scale
    }

    @IBAction func favoriteBtnClick(_ sender: UIButton) {
        delegate?.homeCellDidClickedFavoriteButton(button: sender)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
