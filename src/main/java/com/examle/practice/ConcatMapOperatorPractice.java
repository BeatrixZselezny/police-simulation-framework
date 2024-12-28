package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

public class ConcatMapOperatorPractice {
   public static void main(String[] args) {
      Observable.just("Hello", "RxJava")
         .concatMap(s -> Observable.fromArray(s.split("")))
         .subscribe(System.out::println);
   }
}
