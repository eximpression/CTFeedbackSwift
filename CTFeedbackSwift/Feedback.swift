//
// Created by 和泉田 領一 on 2017/09/25.
// Copyright (c) 2017 CAPH TECH. All rights reserved.
//

import Foundation

public struct Feedback {
    public let email:   String?
    public let to:      [String]
    public let cc:      [String]
    public let bcc:     [String]
    public let subject: String
    public let body:    String
    public let isHTML:  Bool
    public let jpeg:    Data?
    public let mp4:     Data?
}

open class FeedbackClass: NSObject {
    open let subject: String
    open let body:    String
    open let isHTML:  Bool
    open let jpeg:    Data?
    open let mp4:     Data?
    
    init(from feedback: Feedback) {
        subject = feedback.subject
        body = feedback.body
        isHTML = feedback.isHTML
        jpeg = feedback.jpeg
        mp4 = feedback.mp4
        super.init()
    }
}
