//
//  Util.swift
//  HelloMyTopMenu
//
//  Created by Lazy on 2020/1/10.
//  Copyright © 2020 Lazy. All rights reserved.
//

import Foundation
import UIKit

class Util {

    /// 計算高等比放大縮小
    /// 896:414
    /// - Parameters:
    ///   - width: 物件寬
    ///   - height: 物件高
    /// - Returns: 回傳CGFloat(等比放大後的寬)
    static func calculateHeightScaleWithSize(width: CGFloat, height: CGFloat) -> CGFloat {
        // 需要被縮放的物件寬比例，使用設計搞上指定的寬來做為基準
        let scale = width / CGFloat(414)
        // 計算當前物件的寬高比
        let itemScale = height / width
        // 設備寬 x 設計稿上的物件比例 x 當前物件比例
        let result = (UIScreen.main.nativeBounds.width / UIScreen.main.nativeScale) * scale * itemScale
        return result
    }

    /// 計算寬等比放大縮小
    ///
    /// - Parameter width: 被計算的寬
    /// - Returns: 回傳CGFloat
    static func calculateWidthScaleWithSize(width: CGFloat) -> CGFloat {
        let scale = width / CGFloat(414)
        let result = UIScreen.main.bounds.width * scale
        return result
    }
}
