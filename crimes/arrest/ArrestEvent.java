package crimes.arrest;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class ArrestEvent {

    // Method to simulate the arrest of a human trafficker
    public void arrestHumanTrafficker(String traffickerName) {
        // Creating an Observable to simulate the arrest action
        Observable<String> arrestObservable = Observable.create(emitter -> {
            emitter.onNext("Police are arresting " + traffickerName + " for human trafficking.");
            emitter.onComplete(); // Marking the Observable as complete
        });

        // Subscribing to the Observable to perform actions on different threads
        arrestObservable
            .subscribeOn(Schedulers.io()) // Performing emission on IO thread
            .observeOn(Schedulers.single()) // Observing result on single thread
            .subscribe(
                event -> System.out.println(event), // Handling emitted event
                Throwable::printStackTrace, // Handling errors
                () -> System.out.println("Arrest operation completed") // Completion action
            );
    }

}

