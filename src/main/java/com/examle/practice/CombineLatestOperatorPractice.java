package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

public class CombineLatestOperatorPractice {
   public static void main(String[] args) {
      Observable<String> observable1 = Observable.just("A", "B", "C");
      Observable<Integer> observable2 = Observable.just(1, 2, 3);

      Observable.combineLatest(
         observable1,
         observable2,
         (letter, number) -> letter + number
     ).subscribe(System.out::println);

   }
}
