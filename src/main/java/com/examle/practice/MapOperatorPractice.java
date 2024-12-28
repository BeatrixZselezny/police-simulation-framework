package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

public class MapOperatorPractice {
   public static void main(String[] args) {
      Observable.just(1, 2, 3, 4, 5)
         .map(i -> "Number " + i)
         .subscribe(System.out::println);
  }
}
