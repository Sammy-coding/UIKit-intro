//
//  ColorTableVcViewController.swift
//  UIKit-intro
//
//  Created by Mac on 22/11/2023.
//

import UIKit

class ColorTableVcViewController: UIViewController {
    var colors: [UIColor] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        createRandomColors()

        // Do any additional setup after loading the view.
    }

    func createRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVc = segue.destination as! ColorDetails
        destVc.color = sender as? UIColor
    }
}

extension ColorTableVcViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = self.colors[indexPath.row]
        performSegue(withIdentifier: "ToColorDetailsVc", sender: color)
    }
}
