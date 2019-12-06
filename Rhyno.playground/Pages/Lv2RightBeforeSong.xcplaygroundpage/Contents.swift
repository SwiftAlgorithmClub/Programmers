import Foundation

struct Time {
    let hour: Int
    let minute: Int

    func difference(_ time: Time) -> Time {

        let minDiff = self.minute - time.minute

        if minDiff >= 0 {
            return Time(hour: self.hour-time.hour, minute: minDiff)
        } else {
            return Time(hour: self.hour-time.hour-1, minute: 60+minDiff)
        }
    }

    var totalMinute: Int {
        return hour*60 + minute
    }

    init(_ timeLiteral: String) {
        let nums = timeLiteral.split(separator: ":").compactMap{Int($0)}
        hour = nums[0]
        minute = nums[1]
    }

    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
}

extension String {
    func fixRhythm() -> String {
        var arr = Array(self)

        var i = 0
        while i != arr.count {
            if arr[i] == Character("#") {
                arr[i-1] = Character(arr[i-1].lowercased())
                arr.remove(at: i)
            } else {
                i+=1
            }
        }

        return String(arr)
    }
}
struct MusicInfo: Comparable {
    let duration: Int
    let musicName: String
    let originMusic: String
    let playedMusic: String

    init(_ infoLiteral: String) {
        let infos = infoLiteral.split(separator: ",").map {String($0)}

        self.duration = Time(infos[1]).difference(Time(infos[0])).totalMinute
        self.musicName = infos[2]
        self.originMusic = infos[3].fixRhythm()

        var str = ""
        let count = originMusic.count
        if duration < count {
            let index = originMusic.index(originMusic.startIndex, offsetBy: duration)
            self.playedMusic = String(self.originMusic[..<index])
        } else {
            let index = originMusic.index(originMusic.startIndex, offsetBy: duration%count)
            for _ in 0..<(duration/count) {
                str += originMusic
            }
            self.playedMusic = str + originMusic[..<index]
        }
    }

    static func <(_ lhs: MusicInfo, _ rhs: MusicInfo) -> Bool {
        return lhs.duration < rhs.duration
    }

    func contains(_ str: String) -> Bool{
        let str = str.fixRhythm()
        return self.playedMusic.replacingOccurrences(of: str, with: "") != self.playedMusic
    }
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var infos = musicinfos.map{MusicInfo($0)}
    infos.sort(by: >)

    for i in 0..<infos.count {
        if infos[i].contains(m) {
            return infos[i].musicName
        }
    }

    return "(None)"
}
