package com.example.practice;

import io.reactivex.rxjava3.core.Observable;


public class TakeOperatorPractice {
   public static void main(String[] args) {
      Observable.just(1, 2, 3, 4, 5)
      .take(3)
      .subscribe(System.out::println);
   }
}
