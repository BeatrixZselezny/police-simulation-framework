package com.example.practice;

import io.reactivex.rxjava3.core.Observable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import java.util.concurrent.TimeUnit;
import io.reactivex.rxjava3.disposables.Disposable;


   public class DebounceExample {
      public static void main(String[] args) {
      Observable<Integer> numbers = Observable.create(emitter -> {
          emitter.onNext(1);
          Thread.sleep(100);
          emitter.onNext(2);
          Thread.sleep(400);
          emitter.onNext(3);
          emitter.onComplete();
     });

     Disposable disposable = numbers.debounce(300, TimeUnit.MILLISECONDS)
            .subscribe(System.out::println);

     disposable.dispose();

     Schedulers.shutdown();

   }
}
