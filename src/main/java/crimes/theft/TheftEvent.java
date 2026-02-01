
  package crimes.theft;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

// This class is named TheftEvent
  public class TheftEvent {
    // Method to simulate reporting a theft event
     public void reportTheft() {
        // Creating an Observable to simulate the theft report
        Observable<String> theftReported = Observable.create(emitter -> {
	   emitter.onNext("Theft reported."); // Marking the Observable as complete
	   emitter.onComplete();
	});

        // Subscribing to the Observable to perform actions on different threads
	theftReported
		.subscribeOn(Schedulers.io()) // Emitting events on IO thread
		.observeOn(Schedulers.single()) // Observing events on single thread
		.subscribe(
		   event -> System.out.println("Police notified: " + event), // Handling emitted event
		   Throwable::printStackTrace, // Handling errors
		   () -> System.out.println("Theft event completed") // Completion action
		   );
     }
  }
