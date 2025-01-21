package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

   public class ConcatMapExample{
      public static void main(String[] args) {
         Observable<Integer> numbers = Observable.just(1, 2, 3);
         numbers.concatMap(number -> Observable.just(number * 10, number * 100))
                .subscribe(System.out::println);
   }
}

