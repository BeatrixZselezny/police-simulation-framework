
  package crimes.bartenderreport;

  import victims.Victim;
  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class BartenderReportEvent {
    // Method to simulate a bartender reporting suspicious activity to the police
     public void reportToPolice(Victim victim) {
         // Creating an Observable to simulate the report action
        Observable<String> reportObservable = Observable.create(emitter -> {
	   emitter.onNext("Bartender reported suspicious activity involving " + victim.getName());
	   emitter.onComplete(); // Marking the Observable as complete

	});

         // Subscribing to the Observable to perform actions on different threads
	 reportObservable
		 .subscribeOn(Schedulers.io()) // Performing emission on IO thread
		 .observeOn(Schedulers.single()) // Observing result on single thread
		 .subscribe(
		     event -> System.out.println(event), // Handling emitted event
	             Throwable::printStackTrace, // Handling errors
                     () -> System.out.println("Bartender report completed") // Completion action
		  );

     }
  }
