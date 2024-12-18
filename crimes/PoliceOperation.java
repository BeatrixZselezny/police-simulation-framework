
  package crimes;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

// This class is named PoliceOperation
  public class PoliceOperation {
// This method is named main
     public static void main(String[] args) {
        System.out.println("Police operation preparation...");

	// Setting up the operation area
	Observable<String> operationSetup = Observable.create(emitter -> {
	   System.out.println("Police are surrounding the area...");
	   try {
	      Thread.sleep(2000); // Simulating the setup process
	   } catch (InterruptedException e) {
	      e.printStackTrace();
	   }
	   System.out.println("Area secured.");
	   emitter.onNext("Area secured");
	   emitter.onComplete(); // Marking the Observable as complete
	});

        // Subscribing to the Observable to perform actions on different threads
	operationSetup
		.subscribeOn(Schedulers.io()) // Performing emission on IO thread
		.observeOn(Schedulers.single()) // Observing result on single thread
		.subscribe(
			status -> System.out.println("Status: " + status), // Handling emitted status
		        Throwable::printStackTrace, // Handling errors
		        () -> System.out.println("Police operation setup completes.") // Completion action
		);
	System.out.println("PoliceOperation execution finished.");
     }
  }
