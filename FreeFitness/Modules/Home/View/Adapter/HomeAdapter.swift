//
//  HomeAdapter.swift
//  FreeFitness
//
//  Created by W.D. on 21/04/22.
//

import UIKit

class HomeAdapter: NSObject {
    
    // MARK: - Internal Properties
    
    var exercise: [Exercise] = []
    
    var didSelectItemAt: Observable<Exercise> {
        mutableDidSelectItemAt
    }
    
    // MARK: - Private Properties
    private var mutableDidSelectItemAt = MutableObservable<Exercise>()

}

// MARK: - UITableViewDataSource
extension HomeAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.name, for: indexPath) as? ExerciseTableViewCell else {
            return UITableViewCell()
        }
        let exercise = exercise[indexPath.row]
        cell.exercise = exercise
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension HomeAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mutableDidSelectItemAt.postValue(exercise[indexPath.row])
    }
    
    
    
}
