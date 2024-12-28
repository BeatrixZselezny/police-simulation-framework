package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

public class FlatMapOperatorPractice {
   public static void main(String[] args) {
      Observable.just("Hello", "RXJava")
      .flatMap(s -> Observable.fromArray(s.split("")))
      .subscribe(System.out::println);
   }
}


