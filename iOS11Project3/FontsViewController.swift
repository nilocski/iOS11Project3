//
//  FontsViewController.swift
//  iOS11Project3
//
//  Created by Colin Mackenzie on 30/06/2017.
//  Copyright © 2017 cdmackenzie. All rights reserved.
//

import UIKit
import MobileCoreServices

class FontsViewController: UITableViewController, UITableViewDragDelegate {
    
    let fonts = UIFont.familyNames.sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dragDelegate = self
        title = "Fonts"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let fontName = fonts[indexPath.row]
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 18)
        return cell
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let string = fonts[indexPath.row]
        guard let data = string.data(using: .utf8) else { return [] }
        
        let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String)
        return [UIDragItem(itemProvider: itemProvider)]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
