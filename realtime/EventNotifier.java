package realtime;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;

import java.util.concurrent.CountDownLatch;

public class EventNotifier {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("Starting EventNotifier...");

        CountDownLatch latch = new CountDownLatch(1);

        Observable<String> crimeReported = Observable.create(emitter -> {
            System.out.println("Inside Observable.create...");
            emitter.onNext("Human trafficking reported");
            emitter.onNext("Drug dealing reported");
            emitter.onComplete();
            System.out.println("Observable.create complete...");
        });

        System.out.println("After Observable.create...");

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
                    latch.countDown();
                }
            );

        System.out.println("End of main method...");
        latch.await(); // Wait for the observable to complete
    }
}

