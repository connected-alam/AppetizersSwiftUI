//
//  NewButton.swift
//  AppetizersSwiftUI
//
//  Created by Anders Lam on 2023-11-19.
//

import UIKit

class NewButton: UIButton {

    public let loadingView = UIActivityIndicatorView()

    public var isLoading: Bool = false {
        didSet {
            isEnabled = !isLoading
            if isLoading { loadingView.startAnimating() }
            else { loadingView.stopAnimating() }
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemBlue
        layer.cornerRadius = 8
        contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 16)

        loadingView.color = .white
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingView.heightAnchor.constraint(equalToConstant: 24),
            loadingView.widthAnchor.constraint(equalTo: loadingView.heightAnchor)
        ])
    }

    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        super.setTitle("", for: .disabled)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}
