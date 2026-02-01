package crimes;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import java.util.concurrent.TimeUnit;

public class AliceArrest {
    public static void main(String[] args) {
        System.out.println("--- RENDŐRSÉGI AKCIÓ INDUL: ALICE ---");

        Observable<String> arrestAction = Observable.create(emitter -> {
            System.out.println("[REÁLIS IDŐ] A járőrök megérkeznek a helyszínre...");
            Thread.sleep(2000); // Két másodperc feszültség
            
            // Itt kellene meghívni az SQL-t!
            // updateDatabase("UPDATE criminals SET role = 'ARRESTED' WHERE id = 11");
            
            emitter.onNext("Alice bilincsben. Leslie Jackson jelentést ír.");
            emitter.onComplete();
        });

        // ÁTSZERELÉS: .blockingSubscribe-ot használunk, hogy a main szál ne lépjen ki!
        arrestAction
            .subscribeOn(Schedulers.io())
            .observeOn(Schedulers.single())
            .doOnSubscribe(d -> System.out.println("Akció folyamatban..."))
            .blockingSubscribe(
                status -> System.out.println("JELENTÉS: " + status),
                Throwable::printStackTrace,
                () -> System.out.println("--- AZ AKCIÓ SIKERESEN LEZÁRULT ---")
            );

        // Ez már csak akkor fut le, ha a fenti kész!
        System.out.println("A kapitányság visszatér a normál kerékvágásba.");
    }
}
