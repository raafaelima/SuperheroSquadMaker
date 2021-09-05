//
//  UIImageView+LoadThumbnail.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {

    func loadThumbnail(from key: String, rounded: Bool = false) {
        guard let url = URL(string: key) else {
            return
        }

        let defaultThumbnail = UIImage(named: "heroThumbnail")?.circleMask
        self.kf.cancelDownloadTask()
        self.kf.indicatorType = .activity

        if ImageCache.default.imageCachedType(forKey: key).cached {
            loadFromImageCache(key, url, defaultThumbnail, rounded)
        } else {
            self.kf.setImage(with: url, placeholder: defaultThumbnail, options: [.transition(.fade(0.3))])
        }
    }

    private func loadFromImageCache(_ key: String, _ url: URL, _ defaultThumbnail: UIImage?, _ rounded: Bool) {
        ImageCache.default.retrieveImage(forKey: key) { result in
            switch result {
            case .success(let value):
                self.setAnimated(value.image!, rounded)
            case .failure(_):
                self.kf.setImage(with: url, placeholder: defaultThumbnail, options: [.transition(.fade(0.3))])
            }
        }
    }

    private func setAnimated(_ image: UIImage, _ rounded: Bool) {
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak self] in
            if rounded {
                self?.image = image.circleMask
            } else {
                self?.image = image
            }
        })
    }
}
