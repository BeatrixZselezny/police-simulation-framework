package com.example.practice;

import io.reactivex.rxjava3.core.Observable;


   public class FilterExample {
      public static void main(String[] args) {
         Observable<Integer> numbers = Observable.just(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

         numbers.filter(number -> number % 2 == 0)
                .subscribe(System.out::println);
   }
}
