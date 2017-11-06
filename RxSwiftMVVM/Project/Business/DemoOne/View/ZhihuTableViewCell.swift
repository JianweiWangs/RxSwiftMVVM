//
//  ZhihuTableViewCell.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/11/3.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import UIKit
import Kingfisher
class ZhihuTableViewCell: UITableViewCell {
    private var _model: Storie?
    var model: Storie? {
        set {
            self._model = newValue
            titleLabel.text = self._model?.title
            contentImageView.kf.setImage(with: URL(string: (self._model?.images![0])!))
            
        }
        get {
            return self._model
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
}
