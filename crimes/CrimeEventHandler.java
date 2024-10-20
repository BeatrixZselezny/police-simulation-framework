package crimes;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import crimes.theft.TheftEvent;
import crimes.drugdealing.DrugDealingEvent;
import crimes.humantrafficking.HumanTraffickingEvent;
import crimes.rescue.RescueEvent;
import locations.Bar;
import victims.Anna;

public class CrimeEventHandler {
    public static void main(String[] args) {
        System.out.println("Starting CrimeEventHandler...");

        Observable<String> crimeObservable = Observable.create(emitter -> {
            emitter.onNext("Theft reported");
            emitter.onNext("Drug dealing reported");
            emitter.onNext("Human trafficking reported");
            emitter.onComplete();
        });

        crimeObservable
            .subscribeOn(Schedulers.io())
            .observeOn(Schedulers.single())
            .subscribe(
                event -> System.out.println("Event: " + event),
                Throwable::printStackTrace,
                () -> System.out.println("All events processed")
            );

        TheftEvent theftEvent = new TheftEvent();
        theftEvent.reportTheft();

        DrugDealingEvent drugDealingEvent = new DrugDealingEvent();
        drugDealingEvent.reportDrugDealing();

        Bar bar = new Bar();
        HumanTraffickingEvent humanTraffickingEvent = new HumanTraffickingEvent();
        humanTraffickingEvent.startHumanTrafficking(bar);

        // Mentőakció indítása
        Anna anna = new Anna();
        RescueEvent rescueEvent = new RescueEvent();
        rescueEvent.startRescue(anna, "RedLightHouse");
    }
}

