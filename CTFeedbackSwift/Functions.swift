//
// Created by 和泉田 領一 on 2017/09/07.
// Copyright (c) 2017 CAPH TECH. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation

func CTLocalizedString(_ key: String) -> String {
    let bundles: [Bundle] = [Bundle.main, Bundle.feedbackBundle]
    for bundle in bundles {
        let string = NSLocalizedString(key,
                                       tableName: "CTFeedbackLocalizable",
                                       bundle: bundle,
                                       comment: "")
        if key != string { return string }
    }
    return key
}

func getMediaFromImagePickerInfo(_ info: [String : Any]) -> Media? {
    let imageType = kUTTypeImage as String
    let movieType = kUTTypeMovie as String

    switch info[UIImagePickerControllerMediaType] as? String {
    case imageType?:
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            else { return .none }
        return .image(image)
    case movieType?:
        guard let url = info[UIImagePickerControllerMediaURL] as? URL else { return .none }
        return getMediaFromURL(url)
    default:
        return .none
    }
}

func getMediaFromURL(_ url: URL) -> Media? {
    let asset     = AVURLAsset(url: url)
    let generator = AVAssetImageGenerator(asset: asset)
    generator.appliesPreferredTrackTransform = true
    let time = CMTimeMake(1, 1)
    guard let cgImage = try? generator.copyCGImage(at: time, actualTime: .none)
        else { return .none }
    return .video(UIImage(cgImage: cgImage), url)
}

func push<Item>(_ item: Item?) -> (((Item) -> ()) -> ())? {
    guard let item = item else { return .none }
    return { closure in closure(item) }
}
