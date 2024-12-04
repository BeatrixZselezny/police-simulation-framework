
  package crimes;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  // This Class presentation arrest for Human Traficker Cryme Alice
  public class AliceArrest {
// This method is named main
     public static void main(String[] args) {
        System.out.println("Starting Alice's arrest...");

        // Creating an Observable to simulate the arrest action
        Observable<String> arrestAction = Observable.create(emitter -> {
	   System.out.println("Alice realizes she is being caught...");
	   try {
	       Thread.sleep(2000); // Simulating delay
	   } catch (InterruptedException e) {
	      e.printStackTrace();
	   }
	   System.out.println("Alice tries to escape, but the police catch her.");
           emitter.onNext("Alice has been captured and arrested."); //// Emitting the arrest status
	   emitter.onComplete(); // Marking the Observable as complete
	});

        // Subscribing to the Observable to perform actions on different threads arrestAction
	arrestAction
		.subscribeOn(Schedulers.io()) // Performing emission on IO thread
		.observeOn(Schedulers.single()) // Observing result on single thread
		.subscribe(
		   status -> System.out.println("Status: " + status),// Handling emitted status
		   Throwable::printStackTrace,
		   () -> System.out.println("Alice arrest completed.") // Completion action
		);
	    System.out.println("AliceArrest execution finished.");

     }
  }
