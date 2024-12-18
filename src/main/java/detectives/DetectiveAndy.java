package detectives;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;

// This class is named DetectiveAndy
public class DetectiveAndy {
// This method is named startInvestigationEvent
    public Observable<String> startInvestigationEvent() {
        return Observable.create(emitter -> {
            System.out.println("Detective Andy is investigating...");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("Andy found a clue at the crime scene.");
            emitter.onNext("Andy found a clue at the crime scene.");
            emitter.onComplete();
        });
    }
}
