import UIKit
import Messages

class SportGayVC: MSStickerBrowserViewController {
    
    var sportGays = [MSSticker]()
    
    func loadStickers() {
        var sportGayType = 0
        
        if let sportGayDef = UserDefaults(suiteName: "group.gaysSportPacks") {
            if (sportGayDef.value(forKey: "sportGayType") != nil) {
                sportGayType = sportGayDef.integer(forKey: "sportGayType")
            }
        }
        if (sportGayType == 0) {
            createLgbtSticker(asset: "g1", localizedDescription: "1")
            createLgbtSticker(asset: "g2", localizedDescription: "2")
            createLgbtSticker(asset: "g3", localizedDescription: "3")
            createLgbtSticker(asset: "g4", localizedDescription: "4")
            createLgbtSticker(asset: "g5", localizedDescription: "5")
            createLgbtSticker(asset: "g6", localizedDescription: "6")
            createLgbtSticker(asset: "g7", localizedDescription: "7")
            createLgbtSticker(asset: "g8", localizedDescription: "8")
            createLgbtSticker(asset: "g9", localizedDescription: "9")
            createLgbtSticker(asset: "g10", localizedDescription: "10")
        } else if (sportGayType == 1) {
            createLgbtSticker(asset: "l1", localizedDescription: "1")
            createLgbtSticker(asset: "l2", localizedDescription: "2")
            createLgbtSticker(asset: "l3", localizedDescription: "3")
            createLgbtSticker(asset: "l4", localizedDescription: "4")
            createLgbtSticker(asset: "l5", localizedDescription: "5")
            createLgbtSticker(asset: "l6", localizedDescription: "6")
            createLgbtSticker(asset: "l7", localizedDescription: "7")
            createLgbtSticker(asset: "l8", localizedDescription: "8")
        }else if (sportGayType == 2) {
            createLgbtSticker(asset: "i1", localizedDescription: "1")
            createLgbtSticker(asset: "i2", localizedDescription: "2")
            createLgbtSticker(asset: "i3", localizedDescription: "3")
            createLgbtSticker(asset: "i4", localizedDescription: "4")
            createLgbtSticker(asset: "i5", localizedDescription: "5")
            createLgbtSticker(asset: "i6", localizedDescription: "6")
            createLgbtSticker(asset: "i7", localizedDescription: "7")
            createLgbtSticker(asset: "i8", localizedDescription: "8")
        }
    }
    
    func createLgbtSticker(asset: String, localizedDescription: String) {
        
        guard let sportGayPath = Bundle.main.path(forResource: asset, ofType: "png") else {
            
            return
        }
        let sportGayURL = URL(fileURLWithPath: sportGayPath)
        let sportGaySt: MSSticker
        
        do {
            try sportGaySt = MSSticker(contentsOfFileURL: sportGayURL,
                                       localizedDescription: localizedDescription)
            sportGays.append(sportGaySt)
        } catch {
            print(error)
            return
        }
    }
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return sportGays.count
    }
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView,
                                     stickerAt index: Int) -> MSSticker {
        return sportGays[index]
    }
}
