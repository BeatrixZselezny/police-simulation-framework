package com.example.practice;

import io.reactivex.rxjava3.core.Observable;


public class FilterOperatorPractice {
   public static void main(String[] args) {
      Observable.just(1, 2, 3, 4, 5)
         .filter(i -> i % 2 == 0)
         .subscribe(System.out::println);
   }
}
