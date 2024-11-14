
  package crimes;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class AliceArrest {
     public static void main(String[] args) {
        System.out.println("Starting Alice's arrest...");

        Observable<String> arrestAction = Observable.create(emitter -> {
	   System.out.println("Alice felismeri, hogy elkapják...");	
	   try {
	       Thread.sleep(2000);
	   } catch (InterruptedException e) {
	      e.printStackTrace();
	   }
	   System.out.println("Alice megpróbál elmenekülni, de a rendőrök elfogják.");
           emitter.onNext("Alice elfogva és letartóztatva."); 
	   emitter.onComplete();
	});

	arrestAction
		.subscribeOn(Schedulers.io())
		.observeOn(Schedulers.single())
		.subscribe(
		   status -> System.out.println("Status: " + status),		
		   Throwable::printStackTrace,
		   () -> System.out.println("Alice arrest completed.")
		);
	    System.out.println("AliceArrest execution finished.");
	
     }
  }
