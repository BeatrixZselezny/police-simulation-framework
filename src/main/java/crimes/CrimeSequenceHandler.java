package crimes;

import crimes.investigation.InvestigationEventHandler;
import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class CrimeSequenceHandler {
    public static void main(String[] args) {
        System.out.println("Starting CrimeSequenceHandler...");

        InvestigationEventHandler investigationEventHandler = new InvestigationEventHandler();

        Observable<String> crimeSequenceObservable = investigationEventHandler.startInvestigation();

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

