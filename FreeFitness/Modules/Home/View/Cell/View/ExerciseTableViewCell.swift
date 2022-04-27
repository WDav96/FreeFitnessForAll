//
//  ExercisesTableViewCell.swift
//  FreeFitness
//
//  Created by W.D. on 21/04/22.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    static let name = String(describing: ExerciseTableViewCell.self)
    
    // MARK: - Private UI Properties
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var exerciseImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        contentView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(exerciseImage)
        containerStackView.addArrangedSubview(titleLabel)

        addConstraints()
    }
    
    private func addConstraints() {
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        // exerciseImage
        exerciseImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        exerciseImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

}
