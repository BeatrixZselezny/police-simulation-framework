package com.example.practice;

import io.reactivex.rxjava3.core.Observable;


public class SkipOperatorPractice {
   public static void main(String[] args) {
      Observable.just(1, 2, 3, 4, 5)
         .skip(2)
         .subscribe(System.out::println);
   }
}
