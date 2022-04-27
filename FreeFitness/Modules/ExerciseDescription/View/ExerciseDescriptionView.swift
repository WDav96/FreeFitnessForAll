//
//  ExerciseDescriptionView.swift
//  FreeFitness
//
//  Created by W.D. on 27/04/22.
//

import UIKit

class ExerciseDescriptionView: UIView {

    // MARK: - Private UI Properties
    
    private var muscleimage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var muscleNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greenMainColor
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var typeWeightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var setsOnWeekLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var repsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Internal Properties
    
    var muscleImageContent: UIImageView? {
        muscleimage
    }
    
    var muscleNameLabelText: String? {
        get { muscleNameLabel.text }
        set { muscleNameLabel.text = newValue }
    }
    
    var typeWeightLabelText: String? {
        get { typeWeightLabel.text }
        set { typeWeightLabel.text = newValue }
    }
    
    var setsOnWeekLabelText: String? {
        get { setsOnWeekLabel.text }
        set { setsOnWeekLabel.text = newValue }
    }
    
    var repsLabelText: String? {
        get { repsLabel.text }
        set { repsLabel.text = newValue }
    }
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(muscleimage)
        addSubview(muscleNameLabel)
        addSubview(typeWeightLabel)
        addSubview(setsOnWeekLabel)
        addSubview(repsLabel)

        addConstraints()
    }
    
    private func addConstraints() {
        // exerciseImage
        muscleimage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        muscleimage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        muscleimage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        muscleimage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        muscleimage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        // muscleNameLabel
        muscleNameLabel.topAnchor.constraint(equalTo: muscleimage.bottomAnchor, constant: 25).isActive = true
        muscleNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        muscleNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        // typeWeightLabel
        typeWeightLabel.topAnchor.constraint(equalTo: muscleNameLabel.bottomAnchor, constant: 15).isActive = true
        typeWeightLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        typeWeightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        // setsOnWeekLabel
        setsOnWeekLabel.topAnchor.constraint(equalTo: typeWeightLabel.bottomAnchor, constant: 20).isActive = true
        setsOnWeekLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        setsOnWeekLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        // repsLabel
        repsLabel.topAnchor.constraint(equalTo: setsOnWeekLabel.bottomAnchor, constant: 15).isActive = true
        repsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        repsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
    }
}
