//
//  ViewController.swift
//  HelloMyTopMenu
//
//  Created by Lazy on 2020/1/9.
//  Copyright © 2020 Lazy. All rights reserved.
//

import UIKit
import CollectionKit

struct ItemModel {
    var image: UIImage
    var title: String
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: CollectionView!

    @IBOutlet weak var Constrains499: NSLayoutConstraint!
    @IBOutlet weak var Constrains500: NSLayoutConstraint!

    var isOpen = false

    private var provider: Provider? {
        get {
            return collectionView.provider
        }
        set {
            collectionView.provider = newValue
        }
    }

    private var dataSource = ArrayDataSource<ItemModel>()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.data = [ItemModel(image: #imageLiteral(resourceName: "icon_emptyhart25"), title: "未來體"), ItemModel(image: #imageLiteral(resourceName: "icon_favorite"), title: "未來體欲"), ItemModel(image: #imageLiteral(resourceName: "icon_favorite"), title: "未來體"), ItemModel(image: #imageLiteral(resourceName: "icon_favorite"), title: "未來體"), ItemModel(image: #imageLiteral(resourceName: "icon_favorite"), title: "未來體")]
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 0)

        self.provider = BasicProvider(
            dataSource: dataSource,
            viewSource: ClosureViewSource(viewUpdater: { [weak self] (view: ItemCellView, data: ItemModel, index: Int) in
                guard let `self` = self else { return }
                view.imageView.image = data.image
                view.titleLabel.text = data.title
            }),
            sizeSource: { (_, view, size) -> CGSize in
                return CGSize(width: Util.calculateWidthScaleWithSize(width: 124), height: Util.calculateHeightScaleWithSize(width: 124, height: 56))
            },
            layout: FlowLayout(lineSpacing: 10,
                               interitemSpacing: 10,
                               justifyContent: .start,
                               alignItems: .stretch,
                               alignContent: .spaceEvenly), tapHandler: { [weak self] (tap) in
                guard let `self` = self else { return }

            }
        )
    }

    @IBAction func btnPressed(_ sender: Any) {
        isOpen ? close() : open()
        isOpen.toggle()
    }

    private func close() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, animations: { [weak self] in
            guard let `self` = self else { return }
            self.Constrains499.priority = UILayoutPriority(rawValue: 499)
            self.view.layoutIfNeeded()

        }, completion: nil)
    }

    private func open() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, animations: { [weak self] in
            guard let `self` = self else { return }
            self.Constrains499.priority = UILayoutPriority(rawValue: 501)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

