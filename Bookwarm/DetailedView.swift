//
//  DetailedView.swift
//  Bookwarm
//
//  Created by administrator on 11/07/2021.
//

import SwiftUI
import CoreData

struct DetailedView: View {
	let book: Books
	let moc: NSManagedObjectContext
	@State private var alertShowing = false
	@Environment(\.presentationMode) private var pm
	var body: some View {
		GeometryReader{ geo in
			VStack(alignment: .leading){
				Image("\(book.genre ?? "Fantasy")")
					.resizable()
					.scaledToFit()
					.frame(maxWidth: geo.size.width, maxHeight: 300)
				
				Text("Written by: \(book.author ?? "N/A")")
				
				Text("Rating: \(book.rating ?? "N/A")")
				
				Text("Happy Reading!")
			}
			
		}
		.navigationBarTitle("\(book.title ?? "Unknown Title")", displayMode: .large)
		.navigationBarItems(trailing: Button(action: {self.alertShowing.toggle()}){
			Image(systemName: "trash")
		}
		.alert(isPresented: $alertShowing){
			Alert(title: Text("Move to Trash"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete"), action: delete), secondaryButton: .cancel())
		})
		
	}
	
	func delete(){
		self.moc.delete(book)
		try? self.moc.save()
		self.pm.wrappedValue.dismiss()
	}
}

struct DetailedView_Previews: PreviewProvider {
	
	static var previews: some View {
		DetailedView(book:  Books(), moc: .init(concurrencyType: .mainQueueConcurrencyType))
	}
}
