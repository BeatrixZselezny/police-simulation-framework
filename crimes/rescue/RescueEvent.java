package crimes.rescue;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import victims.Victim;
import locations.RedLightHouse;
import locations.DrugDen;

public class RescueEvent {
    // Method to start a rescue operation for a victim at a specified location
    public void startRescue(Victim victim, String location) {
        // Creating an Observable to simulate the rescue operation
        Observable<String> rescueObservable = Observable.create(emitter -> {
            if (location.equals("RedLightHouse")) {
                emitter.onNext("Rescue operation started at Red Light House for " + victim.getName());
            } else if (location.equals("DrugDen")) {
                emitter.onNext("Rescue operation started at Drug Den for " + victim.getName());
            }
            emitter.onComplete(); // Marking the Observable as complete
        });

        // Subscribing to the Observable to perform actions on different threads rescueObservable
        rescueObservable
            .subscribeOn(Schedulers.io()) // Performing emission on IO thread
            .observeOn(Schedulers.single()) // Observing result on single thread
            .subscribe(
                event -> {
                    System.out.println(event);
                    if (Math.random() < 0.7) {
                        System.out.println("Rescue successful for " + victim.getName());
                        victim.setRescued(true); // Setting the victim as rescued
                    } else {
                        System.out.println("Rescue failed for " + victim.getName());
                    }
                },
                Throwable::printStackTrace, // Handling errors
                () -> System.out.println("Rescue operation completed") // Completion action
            );
    }
}

