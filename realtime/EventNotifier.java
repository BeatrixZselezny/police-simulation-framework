package realtime;
import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import java.util.concurrent.CountDownLatch;


// Class representing an Event Notifier with a main method to demonstrate real-time event notifications
public class EventNotifier {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("Starting EventNotifier...");

        // CountDownLatch to wait for the observable to complete
        CountDownLatch latch = new CountDownLatch(1);
        // Creating an observable to report crimes
        Observable<String> crimeReported = Observable.create(emitter -> {
            System.out.println("Inside Observable.create...");
            emitter.onNext("Human trafficking reported");
            emitter.onNext("Drug dealing reported");
            emitter.onComplete();
            System.out.println("Observable.create complete...");
        });

        System.out.println("After Observable.create...");

        // Subscribing to the observable to handle crime reports
        crimeReported
            .subscribeOn(Schedulers.io())
            .observeOn(Schedulers.single())
            .subscribe(
                crime -> {
                    System.out.println("Police notified: " + crime);
                },
                Throwable::printStackTrace,
                () -> {
                    System.out.println("All crimes reported");
                    latch.countDown(); // Count down the latch when all crimes are reported
                }
            );

        System.out.println("End of main method...");
        latch.await(); // Wait for the observable to complete
    }
}

