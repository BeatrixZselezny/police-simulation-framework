package com.example.practice;

import io.reactivex.rxjava3.core.Observable;



   public class MapExample {
      public static void main(String[] args) {
         Observable<Integer> source = Observable.just(1, 2, 3, 4, 5);

         source
         .map(item -> item *2)
         .subscribe(System.out::println);
   }
}
