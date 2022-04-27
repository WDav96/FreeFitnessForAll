//
//  ExerciseDescriptionViewController.swift
//  FreeFitness
//
//  Created by W.D. on 27/04/22.
//

import UIKit

class ExerciseDescriptionViewController: UIViewController {
    
    // MARK: - Private UI properites

    lazy var exerciseDescriptionView: ExerciseDescriptionView = {
        let exerciseDescriptionView = ExerciseDescriptionView()
        return exerciseDescriptionView
    }()
    
    // MARK: - Internal Properties
    
    var exercise: Exercise?
    
    // MARK: - Initializers
    
    init(exercise: Exercise) {
        self.exercise = exercise
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = exerciseDescriptionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupExercise()
    }
    
    // MARK: - Private Methods
    
    private func setupExercise() {
        exerciseDescriptionView.muscleImageContent?.downloaded(from: exercise?.url, placeHolder: .none)
        exerciseDescriptionView.muscleNameLabelText = exercise?.muscleName ?? ""
        exerciseDescriptionView.typeWeightLabelText = exercise?.typeWeight ?? ""
        exerciseDescriptionView.setsOnWeekLabelText = String(exercise?.setsOnWeek ?? 0)
        exerciseDescriptionView.repsLabelText = String(exercise?.reps ?? 0)
    }

}
