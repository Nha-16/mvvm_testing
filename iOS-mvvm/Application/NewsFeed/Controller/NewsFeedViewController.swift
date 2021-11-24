//
//  ViewController.swift
//  iOS-mvvm
//
//  Created by Mavin on 19/11/21.
//

import UIKit

class NewsFeedViewController: UIViewController {

    var articles :[ArticleModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetch()
    }
    
    func fetch(){
        FeedViewModel.shared.fetch {[weak self] articles in
            self?.articles = articles
            self?.tableView.reloadData()
        }
    }

}

extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        cell.detailTextLabel?.text = articles[indexPath.row].byAuthor
        return cell
    }
    
    
}
