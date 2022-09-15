//
//  ContentView.swift
//  ToySwiftUIFirebaseChat
//
//  Created by HYUNJUN CHOI on 9/14/22.
//

import SwiftUI

// MARK: - Summary
/// ContentView --> entire application
    /// normally rename to something that makes sense
    /// right click --> refactor --> rename
    /// rename everywhere --> ex) file name, content view inside of actual application = ToySwiftUIFirebaseChatApp.swift

// 1. create login fields
// simple naviagtion bar at top --> navigationView
struct LoginView : View {
    
    // false = create account
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            ScrollView {
                
                // Last: include padding for all component
                
                // MARK: - Add spacing for element
                /// give email & pw field elements some gap
                VStack(spacing: 16) {
                    // top toggle bar --> ui segmented control in UI kit
                    // inside of SwiftUI --> picker ..
                    // picker has 2 options
                    // easiest selection & laebl content --> provide binding
                    // binding = which states it's in --> login or create account
                    // $ --> get binding
                    // default picker --> create drop down pop up
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        // default selection for picker --> tag
                        // selection tied to isLoginMode --> start value = false
                        // element has a tag of false --> defualt that
                        // click Login --> change the binding = state variable
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                        
                        // MARK: - Picker Missing fucntionality:
                        
                        ///When toggle Picker
                        /// Create Account button -> turns into log in
                        ///  Title bar changes as well
                        ///  solution: modify Title bar = navigationTitle
                        
                    }
                    // get segmented control bar --> pickerStyle
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                    if !isLoginMode {
                        // Don't have down state of image yet
                        // soution: wrapping image inside of button
                        Button {
                            
                        } label: {
                            // include image
                            // use image with systemName
                            // size 34 --> large
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }
                    
                    // MARK: - style email & pw
                    /// Group: apply modifer for all element
                    Group {
                        // TextField component for email & pw
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        // SecureField ==> hide pw
                        SecureField("Password", text: $password)
                    }.padding(12)
                        .background(Color.white)
                    
                    // create account button
                    Button {
                        // MARK: - action of button
                        /// invoke the method
                        handleAction()
                        
                    } label: {
                        // blue button
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                            
                                // preferred font
                                .font(.system(size: 14, weight: .semibold))
                            
                            Spacer()
                        }.background(Color.blue)
                        
                    }
                 
                // MARK: - VStack
                }.padding()
                
            // MARK: - ScrollView
            }
            // make a check of state isLoginMode
            .navigationTitle(isLoginMode ? "Log In": "Create Account")
            
            // MARK: - Gray background
            /// ignoreSafeArea: color expands all the way to the  op & bottom of view
            .background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
            
        // MARK: - NavigationView
        }
        
    // MARK: - some View
    }
    
    private func handleAction() {
        if isLoginMode {
            print("Log into Firebase with existing credentials")
        } else {
            print("Register a new account inside of Firebase Auth and then store image in Storage somehow...")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
