package com.example;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class SchedulerExample {
    public static void main(String[] args) {
        Observable<Integer> observable = Observable.just(1, 2, 3, 4, 5);

        observable
            .subscribeOn(Schedulers.computation())
            .observeOn(Schedulers.newThread())
            .map(number -> number * 2)
            .subscribe(number -> System.out.println("Received: " + number + " on thread " + Thread.currentThread().getName()));  // Javítva

        try {
            Thread.sleep(2000);  // Add a delay to allow the computation to complete before the main thread exits
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}

