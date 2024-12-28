package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

public class TakeWhileOperatorPractice {
   public static void main(String[] args) {
      Observable.just(1, 2, 3, 4, 5)
         .takeWhile(i -> i < 4)
         .subscribe(System.out::println);
   }
}
