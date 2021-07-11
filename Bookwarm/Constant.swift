//
//  Constant.swift
//  Bookwarm
//
//  Created by administrator on 10/07/2021.
//

import Foundation


struct Constant {
	let genres = [ "Fantasy","Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
	var rates = ["star", "star", "star", "star", "star"]
	
	mutating func updateRates(to rating: Int){
		for i in 0..<rates.count{
			if i <= rating{
				self.rates[i] = "star.fill"
			}
			else{
				self.rates[i] = "star"
			}
		}
	}
}



struct EmojiRating {

	func getEmo(of rate: String) -> String{
		switch rate{
		case "1": return "Wrost"
		case "2": return "Avarage"
		case "3": return "Meh"
		case "4": return "Good"
		case "5": return "Wow"
		default: return "N/A"
		}
	}
}
