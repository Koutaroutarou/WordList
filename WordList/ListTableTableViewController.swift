//
//  ListTableTableViewController.swift
//  WordList
//
//  Created by 渡辺航太郎 on 2019/04/06.
//  Copyright © 2019 litech. All rights reserved.
//

import UIKit

class ListTableTableViewController: UITableViewController {
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil),forCellReuseIdentifier: "cell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        tableView.reloadData()
    }


    //セクション数を指定します
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//    セルの個数を指定します
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wordArray.count
    }
    
    //セルの中身の表示の仕方を設定します
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as! ListTableViewCell
            
            let nowIndexPathDictionary = wordArray[indexPath.row]
            
            cell.englishLabel.text = nowIndexPathDictionary["english"]
            cell.japaneseLabel.text = nowIndexPathDictionary["japanese"]
            
            return cell
    }

}
