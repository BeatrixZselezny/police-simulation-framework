
  package crimes;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class PoliceRaid {
     public static void main(String[] args) {
        System.out.println("Starting police raid...");

	Observable<String> raidAction = Observable.create(emitter -> {
           System.out.println("Rendőrök behatolnak a területre...");
	   try {
	      Thread.sleep(2000);
	   } catch (InterruptedException e) {
	      e.printStackTrace();
	   }
	   System.out.println("Rendőrök elfogják Alice-t.");
	   emitter.onNext("Alice elfogva.");
	   emitter.onComplete();
	});
	
	raidAction
		.subscribeOn(Schedulers.io())
		.observeOn(Schedulers.single())
		.subscribe(
		   status -> System.out.println("Status" + status),		
		   Throwable::printStackTrace,
		   () -> System.out.println("Police raid completed.")
		);
	System.out.println("PoliceRaid execution finished.");
     }
  }
