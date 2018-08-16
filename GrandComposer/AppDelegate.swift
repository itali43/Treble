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
    let menu = NSMenu()
    let statusItem = NSStatusBar.system.statusItem(withLength: -2)
    var player = AVQueuePlayer()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        /*TESTING AREA*/
        /*testing area*/

        if let button = statusItem.button {
            button.image = #imageLiteral(resourceName: "trebSmall") // treble white image
            button.target = self
            button.action = #selector(play(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp, .rightMouseDragged])
        }
        print("finish launching")

//            menu.addItem(NSMenuItem(title: "Quit Treble", action: #selector(self.applicationWillTerminate(_:)), keyEquivalent: "q"))
//            statusItem.menu = menu

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc  func play(sender: NSStatusBarButton) {
        let event = NSApp.currentEvent!
        
        if event.type == NSEvent.EventType.rightMouseUp {
            // right clicks!
            
            print("Right click")
            stopSound(file: "NewWorldOne", ext: "mp3")
            if event.clickCount == 2 {
                print("quit? \(event.clickCount)")
            } else {
                print("click not a 2! -  \(event.clickCount)")
            }
//        } else if event.type == NSEvent.EventType.rightMouseDragged {
//            print("right mouse drag click")
//            stopSound(file: "NewWorldOne", ext: "mp3")
//            print("exiting")
            
        }  else {
            // prob left clicks
            print("Left click: \(event.clickCount)")
//    playSound(file: "NewWorldOne", ext: "mp3")
            playSoundFrom(directory: ["NewWorldOne"], ext: "mp3")
    }
        print("hi")
    }

    func playSoundFrom(directory: Array<String>, ext:String) -> Void {
//        let item0 = AVPlayerItem.init(url: Bundle.main.url(forResource: "AirHorn", withExtension: "wav")!)
        let item1 = AVPlayerItem.init(url: Bundle.main.url(forResource: "NewWorldOne", withExtension: "mp3")!)
        let item2 = AVPlayerItem.init(url: Bundle.main.url(forResource: "NewWorldTwo", withExtension: "mp3")!)
        let item3 = AVPlayerItem.init(url: Bundle.main.url(forResource: "NewWorldThree", withExtension: "mp3")!)
        let item4 = AVPlayerItem.init(url: Bundle.main.url(forResource: "NewWorldFour", withExtension: "mp3")!)

        let itemsToPlay:[AVPlayerItem] = [item1, item2, item3, item4]
        do {
            player = try AVQueuePlayer.init(items: itemsToPlay) //AVAudioPlayer(contentsOf: url) // unsafe
            //            guard let player = newplayer else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

    
//    func playSound(file:String, ext:String) -> Void {
//        let url = Bundle.main.url(forResource: file, withExtension: ext)!
//        do {
//            player = try AVAudioPlayer(contentsOf: url) // unsafe
////            guard let player = newplayer else { return }
//
//            player.prepareToPlay()
//            player.play()
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
//
    
    
    func stopSound(file:String, ext:String) -> Void {
//        let url = Bundle.main.url(forResource: file, withExtension: ext)!
        do {
//            player = try AVAudioPlayer(contentsOf: url) // unsafe
            //            guard let player = newplayer else { return }
            player.pause()
            player = AVQueuePlayer()

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
 
 
 
 FILEMANAGER FOOLISHNESS:
 
 let home = FileManager.default.homeDirectoryForCurrentUser
 let playgroundPath = "Documents/treblePlays"
 let playgroundUrl = home.appendingPathComponent(playgroundPath)  //        let completeUrl = URL(fileURLWithPath: completePath)
 print(playgroundUrl)
 let fileManager = FileManager.default
 let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
 do {
 let fileURLs = try fileManager.contentsOfDirectory(at: playgroundUrl, includingPropertiesForKeys: nil)
 // process files
 print("files")
 print(fileURLs)
 } catch {
 print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
 }
 
 
 */
