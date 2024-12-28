package com.example.practice;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.disposables.Disposable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import java.util.concurrent.TimeUnit;

public class ThrottleFirstOperatorPractice {
    public static void main(String[] args) throws InterruptedException {
        Disposable disposable = Observable.interval(100, TimeUnit.MILLISECONDS)
            .take(10)
            .throttleFirst(500, TimeUnit.MILLISECONDS)
            .observeOn(Schedulers.io())
            .doOnNext(item -> System.out.println("Processing: " + item))
            .doOnDispose(() -> System.out.println("Disposing stream"))
            .subscribe(
                item -> System.out.println("Received: " + item),
                Throwable::printStackTrace,
                () -> System.out.println("Completed")
            );

        Thread.sleep(3000); // Növeljük az alvási időt 3000 ms-re vagy több

        disposable.dispose(); // Manuálisan leállítjuk az adatfolyamot

        Schedulers.shutdown(); // Leállítjuk az összes RxJava szálat
    }
}

