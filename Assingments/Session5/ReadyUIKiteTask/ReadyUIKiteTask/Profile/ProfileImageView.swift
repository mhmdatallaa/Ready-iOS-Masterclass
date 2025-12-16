//
//  ProfileImageView.swift
//  ReadyUIKiteTask
//
//  Created by Mohamed Atallah on 14/12/2025.
//

import UIKit

/// Reusable editable profile image view
final class ProfileImageView: UIView {

    var image: UIImage? {
        get { imageView.image }
        set { imageView.image = newValue }
    }

    /// Called when user taps to edit photo
    var onEditTapped: (() -> Void)?

    // MARK: - UI
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(systemName: "person.fill")
        iv.tintColor = .systemGray3
        return iv
    }()

    private let editIconView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "camera.fill")
        iv.tintColor = .white
        iv.backgroundColor = .systemBlue
        iv.contentMode = .center
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        return iv
    }()

    private let tapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup
    private func setup() {
        addSubview(imageView)
        addSubview(editIconView)
        addSubview(tapButton)

        tapButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            editIconView.widthAnchor.constraint(equalToConstant: 32),
            editIconView.heightAnchor.constraint(equalToConstant: 32),
            editIconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            editIconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),

            tapButton.topAnchor.constraint(equalTo: topAnchor),
            tapButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            tapButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            tapButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        imageView.layer.cornerRadius = bounds.width / 2
    }

    // MARK: - Action
    @objc private func editTapped() {
        onEditTapped?()
    }
}
