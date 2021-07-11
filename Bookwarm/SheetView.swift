//
//  SheetView.swift
//  Bookwarm
//
//  Created by administrator on 10/07/2021.
//

import SwiftUI
import CoreData

struct SheetView: View {
	
	@Environment(\.managedObjectContext) private var moc
	@Environment(\.presentationMode) private var pm
	
	
	@State private var title = ""
	@State private var author = ""
	@State private var genre = ""
	@State private var rating = ""
	@State var constants = Constant()
	
	
	
    var body: some View {
		
		VStack(alignment: .leading){
			Form{
				Section{
					TextField("Book Name", text:$title)
					TextField("Author Name", text:$author)
				}
				.textFieldStyle(RoundedBorderTextFieldStyle())
				
				Section{
					Picker("Select Genre", selection: $genre){
						ForEach(constants.genres, id: \.self){
							Text($0)
						}
					}
					.pickerStyle(MenuPickerStyle())
				}
				
				
					
				
			}
			.frame(maxHeight: 300)
			
			VStack(alignment: .leading, spacing: 5){
				Text("Rating")
				HStack(spacing: 2){
					ForEach(0..<constants.rates.count){ rate in
						Button(action: {constants.updateRates(to: rate); self.rating = "\(rate+1)"}){
							Image(systemName: constants.rates[rate])
						}
					}
				}
			}
//			.frame(width: 200)
			.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
			
			Spacer(minLength: 20)
			
			VStack(alignment: .leading){
				Button(action: save){
					Text("Save")
				}
				.frame(width: 100, height: 40)
				.foregroundColor(.blue)
				.background(Color.white)
				.clipShape(Capsule())
				
			}
			.frame(width: 400)
			Spacer()
		}
		.background(Color(#colorLiteral(red: 0.9487653375, green: 0.9494164586, blue: 0.9693213105, alpha: 1)))
    }
	
	func save(){
		let newValue = Books(context: self.moc)
		newValue.title = self.title
		newValue.author = self.author
		newValue.genre = self.genre
		newValue.rating = self.rating
		newValue.id = UUID()
		
		do{
			try self.moc.save()
		}
		catch{
			print("Couldn't save the data")
		}
		
		self.pm.wrappedValue.dismiss()
	}
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
