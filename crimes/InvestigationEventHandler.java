package crimes;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import detectives.DetectiveAndy;

public class InvestigationEventHandler {
    public static void main(String[] args) {
        System.out.println("Starting InvestigationEventHandler...");

        DetectiveAndy detectiveAndy = new DetectiveAndy();

        Observable<String> investigationObservable = detectiveAndy.startInvestigationEvent();

        investigationObservable
            .subscribeOn(Schedulers.io())
            .observeOn(Schedulers.single())
            .subscribe(
                clue -> {
                    System.out.println("Clue: " + clue);
                    System.out.println("Detective Andy is reporting his findings...");
                    System.out.println("Detective Andy has reported the clues: " + clue);
                },
                Throwable::printStackTrace,
                () -> System.out.println("Investigation by Detective Andy completed")
            );

        // Add a delay to ensure Observable completes before main method ends
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("InvestigationEventHandler execution finished.");
    }
}
