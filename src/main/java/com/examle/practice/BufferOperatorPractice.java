package com.example.practice;

import io.reactivex.rxjava3.core.Observable;
import java.util.List;

public class BufferOperatorPractice {
   public static void main(String[] args) {
   Observable.just(1, 2, 3, 4, 5, 6, 7, 8, 9)
      .buffer(3)
      .subscribe(list -> System.out.println("Buffer: " + list));
   }
}
