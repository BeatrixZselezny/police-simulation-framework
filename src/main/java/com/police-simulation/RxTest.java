import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;

// This class is named RxTest
public class RxTest {
// This method is named main
    public static void main(String[] args) {
        // Egy egyszerű Observable teszt
        Observable.just("Hello, RxJava!")
                  .subscribeOn(Schedulers.io())  // Aszinkron végrehajtás IO szálon
                  .observeOn(Schedulers.single()) // Egyetlen szálon történik az observe
                  .subscribe(System.out::println);  // Kiírja a konzolra
    }
}
