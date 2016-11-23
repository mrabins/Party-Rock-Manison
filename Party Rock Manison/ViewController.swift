//
//  ViewController.swift
//  Party Rock Mansion
//
//  Created by Mark Rabins on 11/22/16.
//  Copyright © 2016 self.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/ev4bY1SkZLg/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=wu8nQ4Kj5WblFEVyVw_ZovfCLMg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/Md-8YlE-KhA/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=LNUgfabMX-O17yvLiMnI5KZdEY4", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Md-8YlE-KhA?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Booty Man")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/tWyuglGCKgE/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=tZWE9Yflbx0HxzeO9ZZ3Zk51hHo", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/xGiBiHocSZM/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=KQo7xeHPLfmlkrStyYz31AQw1kM", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xGiBiHocSZM?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "New Thang")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/1w9DiGlZksU/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=g1DTXpaVLQhtf9fTu3hAUMjKykI", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1w9DiGlZksU?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "segueToVideo", sender: partyRock)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoViewController {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyTableViewCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
            
        }
        
    }
}


