package crimes.humantrafficking;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import victims.Victim;
import victims.Anna;
import locations.Bar;

public class HumanTraffickingEvent {
    public void startHumanTrafficking(Bar bar) {
        System.out.println("HumanTraffickingEvent started with bar");
        Observable<Victim> victimObservable = Observable.create(emitter -> {
            System.out.println("Creating victim...");
            Victim victim = new Anna();
            System.out.println("Emitting victim: " + victim.getName());
            emitter.onNext(victim);
            emitter.onComplete();
        });

        victimObservable
            .subscribeOn(Schedulers.computation())
            .observeOn(Schedulers.single())
            .doOnSubscribe(disposable -> System.out.println("Subscribed to victimObservable"))
            .doOnNext(victim -> System.out.println("Processing victim: " + victim.getName()))
            .doOnComplete(() -> System.out.println("VictimObservable complete"))
            .subscribe(
                victim -> {
                    System.out.println("Alice found a victim: " + victim.getName());
                    if (Math.random() < 0.5) {
                        System.out.println(victim.getName() + " accepted the drink.");
                        victim.setTrafficked(true);
                        System.out.println("Alice successfully trafficked " + victim.getName());
                    } else {
                        System.out.println(victim.getName() + " did not accept the drink.");
                    }
                },
                Throwable::printStackTrace,
                () -> System.out.println("Human trafficking event completed")
            );
    }
}

