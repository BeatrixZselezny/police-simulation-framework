package com.example.practice;

import io.reactivex.rxjava3.core.Observable;


   public class ReduceExample {
      public static void main(String[] args) {
      Observable<Integer> numbers = Observable.just(1, 2, 3, 4, 5);

      numbers.reduce((acc, number) -> acc + number)
             .subscribe(System.out::println);
   }
}
