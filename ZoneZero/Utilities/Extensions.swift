//
//  Extensions.swift
//  ZoneZero
//
//  Created by Bilgihan Köse on 27.09.2020.
//

import UIKit

extension RegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let strLength = textField.text?.count ?? 0
        let lngthToAdd = string.count
        lengthCount = strLength + lngthToAdd
        return true
    }
}


extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.movieListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        cell.textLabel!.text = movieArray.movieListArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Selected Movie", message: "You choose: \(movieArray.movieListArray[indexPath.row])", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}


extension UIViewController {
    func hapticFeedback(){
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
}
