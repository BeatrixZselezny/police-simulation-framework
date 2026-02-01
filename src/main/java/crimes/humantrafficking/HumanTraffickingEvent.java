package crimes.humantrafficking;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import victims.Victim;
import victims.Anna;
import locations.Bar;

// This class is named HumanTraffickingEvent
public class HumanTraffickingEvent {
    // Method to start a human trafficking event at a specified bar
    public void startHumanTrafficking(Bar bar) {
        System.out.println("HumanTraffickingEvent started with bar");
        // Creating an Observable to simulate the creation and handling of a victim
        Observable<Victim> victimObservable = Observable.create(emitter -> {
            System.out.println("Creating victim...");
            Victim victim = new Anna(); // Creating a new victim
            System.out.println("Emitting victim: " + victim.getName());
            emitter.onNext(victim); // Emitting the created victim
            emitter.onComplete(); // Marking the Observable as complete
        });

        // Subscribing to the Observable to perform actions on different threads
        victimObservable
            .subscribeOn(Schedulers.computation()) // Performing emission on computation thread
            .observeOn(Schedulers.single()) // Observing result on single thread
            .doOnSubscribe(disposable -> System.out.println("Subscribed to victimObservable"))
            .doOnNext(victim -> System.out.println("Processing victim: " + victim.getName()))
            .doOnComplete(() -> System.out.println("VictimObservable complete"))
            .subscribe(
                victim -> {
                    System.out.println("Alice found a victim: " + victim.getName());
                    if (Math.random() < 0.5) {
                        System.out.println(victim.getName() + " accepted the drink.");
                        victim.setTrafficked(true); // Setting the victim as trafficked
                        System.out.println("Alice successfully trafficked " + victim.getName());
                    } else {
                        System.out.println(victim.getName() + " did not accept the drink.");
                    }
                },
                Throwable::printStackTrace, // Handling errors
                () -> System.out.println("Human trafficking event completed") // Completion action
            );
    }
}

