//
//  ViewController.swift
//  WebScrapingSwift
//
//  Created by Aldino Efendi on 2021/10/21.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {
	
	var judul: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
		label.font = .systemFont(ofSize: 20, weight: .regular)
		label.numberOfLines = 0
		return label
	}()
	
	var deskripsi: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
		label.font = .systemFont(ofSize: 12, weight: .regular)
		label.numberOfLines = 0
		return label
	}()
	
	// function declaration
	func scrap(url: URL, elementTarget: String) throws -> String {
		// Change HTML script into string
		let html = try String(contentsOf: url)
		
		// Parse HTML string into SwiftSoup
		let document = try SwiftSoup.parse(html)
		
		// Dynamic select element from parameter and change into string
		let select = try document.select(elementTarget).text()
		return select
	}
	
	override func loadView() {
		super.loadView()
		view.backgroundColor = .white
		
		view.addSubview(judul)
		judul.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
		judul.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		judul.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
		
		view.addSubview(deskripsi)
		deskripsi.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
		deskripsi.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		deskripsi.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
		
		
		// url declaration
		let url = URL(string: "https://www.lifehacker.jp/2021/10/244296behavior-business-meeting.html")!
		
		judul.text = try! scrap(url: url, elementTarget: "h1.lh-summary-title")
		deskripsi.text = try! scrap(url: url, elementTarget: "div#realEntryBody > p")
		
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

