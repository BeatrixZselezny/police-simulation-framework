package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

public class ReduceOperatorPractice {
   public static void main(String[] args) {
      Observable.just(1, 2, 3, 4)
          .reduce((x, y) -> x + y)
          .subscribe(System.out::println);
   }
}
