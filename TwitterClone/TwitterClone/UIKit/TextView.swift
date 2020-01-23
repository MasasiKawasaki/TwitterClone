//
//  TextView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/22.
//  Copyright © 2020 Kawasaki Masasi. All rights reserve

import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
  typealias UIViewType = UITextView
   
  var placeholderText: String = "write content here"
  @Binding var text: String
   
  func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
    let textView = UITextView()
     
    textView.textContainer.lineFragmentPadding = 0
    textView.textContainerInset = .zero
    textView.font = UIFont.systemFont(ofSize: 17)
     
    textView.text = placeholderText
    textView.textColor = .placeholderText
     
    return textView
  }
   
  func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
     
    if text != "" || uiView.textColor == .label {
        uiView.text = self.text
      uiView.textColor = .label
    }
     
    uiView.delegate = context.coordinator
  }
   
  func frame(numLines: CGFloat) -> some View {
    let height = UIFont.systemFont(ofSize: 17).lineHeight * numLines
    return self.frame(height: height)
  }
   
  func makeCoordinator() -> TextView.Coordinator {
    Coordinator(self)
  }
   
  class Coordinator: NSObject, UITextViewDelegate {
    var parent: TextView
     
    init(_ parent: TextView) {
      self.parent = parent
    }
     
    func textViewDidChange(_ textView: UITextView) {
      parent.text = textView.text
    }
     
    func textViewDidBeginEditing(_ textView: UITextView) {
      if textView.textColor == .placeholderText {
        textView.text = ""
        textView.textColor = .label
      }
    }
     
    func textViewDidEndEditing(_ textView: UITextView) {
      if textView.text == "" {
        textView.text = parent.placeholderText
        textView.textColor = .placeholderText
      }
    }
  }
}
