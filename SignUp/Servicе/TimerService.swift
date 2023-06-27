import UIKit

class TimerService {
    private var timer: Timer?
    private var tickListeners: [String: (() -> Void)?] = [:]

    init() {
        createTimer()
    }

    func addListener(name: String, completion: @escaping () -> Void) {
        tickListeners[name] = completion
    }

    func removeListener(name: String) {
        tickListeners.removeValue(forKey: name)
    }

    func clear() {
        tickListeners.removeAll()
//        tickListeners = [:]
    }

    @objc func timerTick() {
        tickListeners.values.forEach {
            $0?()
        }
    }

    func createTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
        self.timer = timer
        RunLoop.current.add(timer, forMode: .common)
        timer.tolerance = 0.1
    }

    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
}
