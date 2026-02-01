package detectives;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;

// Class representing Detective Andy and his investigation events
public class DetectiveAndy {
// This method is named startInvestigationEvent
    public Observable<String> startInvestigationEvent() {
        // Method to start an investigation event and return an Observable
        return Observable.create(emitter -> {
            System.out.println("Detective Andy is investigating...");
            try {
                // Simulating investigation delay
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("Andy found a clue at the crime scene.");
            emitter.onNext("Andy found a clue at the crime scene."); // Emitting the investigation result
            emitter.onComplete(); // Marking the Observable as complete
        });
    }
}
