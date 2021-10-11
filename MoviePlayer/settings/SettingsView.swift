//
//  SettingsView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct SettingsView: View {
    
    
    @State private var selection:  String? = nil
    
    var body: some View {
        
        
        
        NavigationView {
            
            List {
                
                Section {
                    NavigationLink(
                        destination: Text("Profile"),
                        label: {
                            HStack(spacing: 20) {
                             Circle()
                                .fill(Color.gray)
                                .frame(width: 70)
                                
                                VStack(alignment: .leading) {
                                Text("Max Mustermann")
                                    .font(.title)
                                Text("Apple ID, iCloud, & App Store")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                }
                            }
                            
                        })
                
                
                NavigationLink(
                    destination: Text("Suggestions"),
                    label: {
                        Text("Apple ID Suggestions")
                    })
            
                }
                
                Section {
                    HStack {
                        Color.red.frame(width: 30, height: 30)
                            .cornerRadius(3.0)
                       
                        Toggle(isOn: .constant(false), label: {
                            Text("Lorum Ipsum")
                        })
                    }
                    
                    Picker(selection: $selection, label: SettingsCell(color: .blue), content: {
                        Text("1").tag("1")
                        Text("2").tag("2")
                    })
          
                    
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            SettingsCell(color: .blue)
                        })
                    
                    
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            HStack {
                                SettingsCell(color: .green)
                                Spacer()
                                Text("Off")
                                    .foregroundColor(.gray)
                            }
                        })
                    
                    
                    
                }
            }
            .listStyle(GroupedListStyle())
            
            
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


struct SettingsCell: View {
    let color: Color
    var body: some View {
        
        HStack {
            color.frame(width: 30, height: 30)
                .cornerRadius(3.0)
            
            Text("Lorum Ipsum")
        }
    }
}
