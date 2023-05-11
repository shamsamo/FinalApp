//
//  PhotoDesc.swift
//  FinalApp
//
//  Created by Shamsa Mohamed on 4/11/23.
//

import Foundation
import UIKit

class PhotoDesc: Codable {
    var imageName: String
    var imageDesc: String
//    var backgroundColor: UIColor
    var upperLeftSticker = ""
    var upperRightSticker = ""
    var bottomLeftSticker = ""
    var bottomRight = ""
    init(imageName: String, imageDesc: String, upperLeftSticker: String = "", upperRightSticker: String = "", bottomLeftSticker: String = "", bottomRight: String = "") {
        self.imageName = imageName
        self.imageDesc = imageDesc
        self.upperLeftSticker = upperLeftSticker
        self.upperRightSticker = upperRightSticker
        self.bottomLeftSticker = bottomLeftSticker
        self.bottomRight = bottomRight
    }
}
 var s1 = PhotoDesc(imageName: "dime", imageDesc: "10c")
var s2 = PhotoDesc(imageName: "quarter", imageDesc: "25c")
