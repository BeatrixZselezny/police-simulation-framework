package com.example.practice;

import io.reactivex.rxjava3.core.Observable;

public class MergeOperatorPractice {
   public static void main(String[] srgs) {
   Observable<Integer> observable1 = Observable.just(1, 2, 3);
   Observable<Integer> observable2 = Observable.just(4, 5, 6);

   Observable.merge(observable1, observable2)
   .subscribe(System.out::println);

   }
}
