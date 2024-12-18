package crimes;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import crimes.theft.TheftEvent;
import crimes.drugdealing.DrugDealingEvent;
import crimes.humantrafficking.HumanTraffickingEvent;
import crimes.rescue.RescueEvent;
import locations.Bar;
import victims.Anna;

// This class is named CrimeEventHandler
public class CrimeEventHandler {
// This method is named main
    public static void main(String[] args) {
        System.out.println("Starting CrimeEventHandler...");

        // Creating an Observable to simulate crime events
        Observable<String> crimeObservable = Observable.create(emitter -> {
            emitter.onNext("Theft reported");
            emitter.onNext("Drug dealing reported");
            emitter.onNext("Human trafficking reported");
            emitter.onComplete(); // Marking the Observable as complete
        });

        // Subscribing to the Observable to process events on different threads
        crimeObservable
            .subscribeOn(Schedulers.io()) // Emitting events on IO thread
            .observeOn(Schedulers.single()) // Observing events on single thread
            .subscribe(
                event -> System.out.println("Event: " + event), // Handling emitted events
                Throwable::printStackTrace, // Handling errors
                () -> System.out.println("All events processed") // Completion action
            );

        // Reporting theft event
        TheftEvent theftEvent = new TheftEvent();
        theftEvent.reportTheft();

        // Reporting drug dealing event
        DrugDealingEvent drugDealingEvent = new DrugDealingEvent();
        drugDealingEvent.reportDrugDealing();

        // Starting human trafficking event
        Bar bar = new Bar();
        HumanTraffickingEvent humanTraffickingEvent = new HumanTraffickingEvent();
        humanTraffickingEvent.startHumanTrafficking(bar);

        // Starting rescue operation
        Anna anna = new Anna();
        RescueEvent rescueEvent = new RescueEvent();
        rescueEvent.startRescue(anna, "RedLightHouse");
    }
}

