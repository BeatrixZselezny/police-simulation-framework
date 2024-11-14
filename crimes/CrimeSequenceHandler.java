package crimes;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import detectives.DetectiveAndy;
import crimes.investigation.InvestigationEvent;

public class CrimeSequenceHandler {
    public static void main(String[] args) {
        System.out.println("Starting CrimeSequenceHandler...");

        DetectiveAndy detectiveAndy = new DetectiveAndy();
        InvestigationEvent investigationEvent = new InvestigationEvent();

        Observable<String> crimeSequenceObservable = Observable.create(emitter -> {
            System.out.println("Starting investigation sequence...");
            investigationEvent.startInvestigation();
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            emitter.onNext("Investigation phase completed.");
            emitter.onComplete();
        });

        crimeSequenceObservable
            .subscribeOn(Schedulers.io())
            .observeOn(Schedulers.single())
            .subscribe(
                event -> System.out.println(event),
                Throwable::printStackTrace,
                () -> System.out.println("Crime sequence completed")
            );
    }
}
