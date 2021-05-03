//
//  ContentView.swift
//  Barter Demo
//
//  Created by admin on 4/22/21.
//

import SwiftUI

let deeproseColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255/0)

let storedUsername = "Christie"
let storedPassword = "Richardson"

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                Barter()
                Shop()
                UsernameField(username: $username)
                PasswordField(password: $password)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                Button(action: {
                    if self.username == storedUsername && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                    } else {
                        self.authenticationDidFail = false
                    }
                }){
                    LoginButtonContent()
                }
            }
            .padding()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}


struct Barter: View {
    var body: some View {
        Text("The Barter Shop")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 10.0)
        
    }
}


struct Shop: View {
    var body: some View {
        Image("Bart 2")
            .resizable()
            .scaledToFit()
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 50)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}
struct UsernameField: View {
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(deeproseColor)
            .cornerRadius(4.0)
            .padding(4.0)
    }
}

struct PasswordField: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(deeproseColor)
            .cornerRadius(4.0)
            .padding(4.0)
    }
}
