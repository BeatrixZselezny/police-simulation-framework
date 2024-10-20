package crimes.rescue;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import victims.Victim;
import locations.RedLightHouse;
import locations.DrugDen;

public class RescueEvent {
    public void startRescue(Victim victim, String location) {
        Observable<String> rescueObservable = Observable.create(emitter -> {
            if (location.equals("RedLightHouse")) {
                emitter.onNext("Rescue operation started at Red Light House for " + victim.getName());
            } else if (location.equals("DrugDen")) {
                emitter.onNext("Rescue operation started at Drug Den for " + victim.getName());
            }
            emitter.onComplete();
        });

        rescueObservable
            .subscribeOn(Schedulers.io())
            .observeOn(Schedulers.single())
            .subscribe(
                event -> {
                    System.out.println(event);
                    if (Math.random() < 0.7) {
                        System.out.println("Rescue successful for " + victim.getName());
                        victim.setRescued(true);
                    } else {
                        System.out.println("Rescue failed for " + victim.getName());
                    }
                },
                Throwable::printStackTrace,
                () -> System.out.println("Rescue operation completed")
            );
    }
}

