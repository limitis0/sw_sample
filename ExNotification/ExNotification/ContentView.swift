//
//  ContentView.swift
//  ExNotification
//
//  Created by  Ting-Wei Lee on 2020/8/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button(action: {
                let content = UNMutableNotificationContent()
                content.title = "TEST TITLE!"
                content.subtitle = "Test Subtitle"
                content.body = "test body"
                content.sound = UNNotificationSound.default //can be customized (also badge)
                
//                add pic
                if let image = UIImage(named: "img_01"){
                    let tempDirURL = URL(fileURLWithPath: NSTemporaryDirectory(),
                                         isDirectory: true)
                    let tempFileURL = tempDirURL.appendingPathComponent("img_01.png")
                    
                    try? image.jpegData(compressionQuality: 1.0)?.write(to: tempFileURL)
                    if let mobiledevImage = try? UNNotificationAttachment(identifier: "img_01", url: tempFileURL, options: nil) {
                        content.attachments = [mobiledevImage]
                    }
                    
                }
//                add pic end
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10,
                                                                repeats: false)
                let request = UNNotificationRequest(identifier: "Notification test",
                                                    content: content,
                                                    trigger: trigger)
                UNUserNotificationCenter.current()
                    .add(request,
                         withCompletionHandler: nil)
            }){
                Text("Start!")
            }
        }.onAppear{
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge]){ //user allowance
                    (granted, error) in
                    if granted{
                        print("User Notification Set!")
                    }else{
                        print("User Do Not Allowed!")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
