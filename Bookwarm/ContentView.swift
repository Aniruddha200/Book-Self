//
//  ContentView.swift
//  Bookwarm
//
//  Created by administrator on 10/07/2021.
//

import SwiftUI
import CoreData


struct AddButton: View {
	
	@State private var isSheetShowing = false
	var body: some View {
		Button(action:{self.isSheetShowing.toggle()}){
			Image(systemName: "plus")
		}
		.sheet(isPresented: $isSheetShowing){
			SheetView()
		}
	}
	
}

struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Books.entity(), sortDescriptors: []) private var books: FetchedResults<Books>
	let emo = EmojiRating()
	
	
	var body: some View{
		NavigationView{
			List{
				ForEach(books){book in
					HStack(spacing: 60){
						Text("\(emo.getEmo(of: book.rating ?? "0"))")
						
						VStack{
							Text("\(book.title ?? "Unknown Title")")
								.font(.headline)
							Text("\(book.author ?? "N/A")")
								.font(.subheadline)
						}
						
						NavigationLink("", destination: DetailedView(book: book, moc: moc))
					}
					.foregroundColor((book.rating ?? "0") < "2" ? .red : .black)
				}
				.onDelete(perform: delete)
			}
			.navigationBarTitle("Book Self", displayMode: .inline)
			.navigationBarItems(leading: EditButton(), trailing: AddButton())
		}
	}
	
	func delete(at indices: IndexSet){
		for index in indices{
			do{
				self.moc.delete(books[index])
				try self.moc.save()
			}
			catch{
				print("Deletion Failed!")
			}
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
