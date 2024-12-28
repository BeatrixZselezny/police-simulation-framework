package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

public class DistinctUntilChangedOperatorPractice {
   public static void main(String[] args) {
      Observable.just(1, 2, 2, 3, 3, 3, 4)
      .distinctUntilChanged()
      .subscribe(System.out::println);
   }
}
