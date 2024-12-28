package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

import java.util.concurrent.TimeUnit;

public class DebounceOperatorPractice {
   public static void main(String[] args) {
      Observable.create(emitter -> {
      emitter.onNext(1);
      Thread.sleep(100);
      emitter.onNext(2);
      Thread.sleep(300);
      emitter.onNext(3);
      emitter.onComplete();
     })
     .debounce(200, TimeUnit.MILLISECONDS)
     .subscribe(System.out::println);

   }
}
