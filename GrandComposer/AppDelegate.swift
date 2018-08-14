//
//  AppDelegate.swift
//  GrandComposer
//
//  Created by Elliott Williams on 8/14/18.
//  Copyright © 2018 AgrippaApps. All rights reserved.
//


// CONCEPT
/*
 It would be nice to have a folder of music from which you can play at random.  As if it is a soundtrack of your working.
 
 V2: Drag and Drop add to library.   
 */
import Cocoa
import AVFoundation



@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let statusItem = NSStatusBar.system.statusItem(withLength: -2)
    var player = AVAudioPlayer()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = #imageLiteral(resourceName: "trebSmall")
            button.target = self
            button.action = #selector(play(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])


            
            
        }
        print("finish launching")

        
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc  func play(sender: NSStatusBarButton) {
        let event = NSApp.currentEvent!
        
        if event.type == NSEvent.EventType.rightMouseUp {
            print("Right click")
            stopSound(file: "NewWorldOne", ext: "mp3")
        } else {
            print("Left click")
            playSound(file: "NewWorldOne", ext: "mp3")

        }
        print("hi")
    }

    
    func playSound(file:String, ext:String) -> Void {
        let url = Bundle.main.url(forResource: file, withExtension: ext)!
        do {
            player = try AVAudioPlayer(contentsOf: url) // unsafe
//            guard let player = newplayer else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound(file:String, ext:String) -> Void {
        let url = Bundle.main.url(forResource: file, withExtension: ext)!
        do {
            player = try AVAudioPlayer(contentsOf: url) // unsafe
            //            guard let player = newplayer else { return }
            player.stop()
//            player.prepareToPlay()
//            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }


}

/*
 MARK:= Credits
 Icon:
 <div>Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
 
 */






/*
 
 SEQUENTIAL:
 var playerQueue: AVQueuePlayer = {
 let url1 = NSBundle.mainBundle().URLForResource("UpTown", withExtension: "mp3")!
 let url2 = NSBundle.mainBundle().URLForResource("TurnMeOn", withExtension: "mp3")!
 
 let item1 = AVPlayerItem(URL: url1)
 let item2 = AVPlayerItem(URL: url2)
 
 let queue = AVQueuePlayer(items: [item1, item2])   // MAJOR 🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑
 return queue
 }()
 
 override func viewDidLoad() {
 super.viewDidLoad()
 playerQueue.play()
 }
 
 
 
 
 */
