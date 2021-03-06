//
//  ViewController.swift
//  SwiftWords
//
//  Created by benjamin kent on 4/9/21.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(newGame))
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        startGame()
    }
    
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    @objc func newGame(){
        startGame()
    }
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter Word", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
    
    func submit(_ answer: String){
        let lowerAnswer = answer.lowercased()
        
        let errorTitle: String
        let errorMessage: String
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer){
                    usedWords.insert(lowerAnswer, at: 0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    
                    return
                } else {
                    errorTitle = "Word not recognised"
                    errorMessage = "You can't just make them up"
                }
                
            } else {
                errorTitle = "Word already used"
                errorMessage = "Try more originality"
            }
        } else {
            guard let title = title?.lowercased() else {return}
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from \(title)"
        }
        ViewController.toastUp(context: self, titleMsg: errorTitle, msg: errorMessage)
        
    }
        
    func isPossible(word: String) -> Bool {
        if word.count == 0  {
            return false
        }
        guard var tempWord = title?.lowercased() else { return false }
        // prevents the user from using single letter twice or more.
        for letter in word {
            if let position = tempWord.firstIndex(of: letter){
                tempWord.remove(at: position)
            } else  {
                return false
            }
        }
        return true
    }
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    // Andrey Rudenko: How to add toast message in swift
    static func toastUp(context ctx: UIViewController, titleMsg: String, msg: String) {
        
        let toast = UILabel(frame: CGRect(x: 16, y: ctx.view.frame.height / 2, width: ctx.view.frame.size.width - 32, height: 100))
        
        toast.backgroundColor = UIColor.lightGray
        toast.textColor = UIColor.white
        toast.textAlignment = .center
        toast.numberOfLines = 3
        toast.font = UIFont.systemFont(ofSize: 20)
        toast.layer.cornerRadius = 12;
        toast.clipsToBounds = true
        toast.text = titleMsg
        toast.text?.append(contentsOf: " \(msg)")
        ctx.view.addSubview(toast)
        
        UIView.animate(withDuration: 8.5, delay: 0.2, options: .curveEaseOut, animations: {toast.alpha = 0.0}, completion: {(isCompleted) in toast.removeFromSuperview()})
    }
}

