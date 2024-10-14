  package policestation;

  import java.util.ArrayList;
  import java.util.List;



  class DogKennel {
	  public List<PoliceDog> dogs;


	  public DogKennel() {
		  this.dogs = new ArrayList<>();
	  }

	  public void addDog(PoliceDog dog) {
		  dogs.add(dog);
	  }

	  public void removeDog(PoliceDog dog) {
		  dogs.remove(dog);
	  }

	  public List<PoliceDog> getDogs() {
		  return dogs;
	  }

	  @Override
	  public String toString() {
		  return "DogKennel{" +
			  "dogs=" + dogs +
			  '}';
	  }
  }

 
  public class PoliceDogHandler extends DogKennel {
	  public void trainDog(PoliceDog dog) {
		  System.out.println(dog.getName() + " is being trained.");
	  }

	  public static void main(String[] args) {
		  PoliceDogHandler policeDogs = new PoliceDogHandler();

		  PoliceDog dog1 = new PoliceDog("Rex", "German Shepherd");
		  PoliceDog dog2 = new PoliceDog("Max", "Belgian Malinois");
		  PoliceDog dog3 = new PoliceDog("Bella", "Rottweiler");
		  PoliceDog dog4 = new PoliceDog("Charlie", "Doberman Pinscher");
		  PoliceDog dog5 = new PoliceDog("Lucy", "Labrador Retriever");
		  PoliceDog dog6 = new PoliceDog("Molly", "Dutch Shepherd");
		  PoliceDog dog7 = new PoliceDog("Daisy", "Bloodhound");
		  PoliceDog dog8 = new PoliceDog("Bailey", "English Springer Spaniel");
		  PoliceDog dog9 = new PoliceDog("Sadie", "Border Collie");
		  PoliceDog dog10 = new PoliceDog("Rocky", "Boxer");



		  policeDogs.addDog(dog1);
		  policeDogs.addDog(dog2);
		  policeDogs.addDog(dog3);
		  policeDogs.addDog(dog4);
		  policeDogs.addDog(dog5);
		  policeDogs.addDog(dog6);
		  policeDogs.addDog(dog7);
		  policeDogs.addDog(dog8);
		  policeDogs.addDog(dog9);
		  policeDogs.addDog(dog10);

		  policeDogs.trainDog(dog1);

                for (PoliceDog dog : policeDogs.getDogs()) {
                     System.out.println(dog);
		}
	  }
  }


  class PoliceDog {
	  private String name;
	  private String breed;

	  public PoliceDog(String name, String breed) {
		  this.name = name;
		  this.breed = breed;
	  }

	  public String getName() {
		  return name;
	  }

	  public String getBreed() {
		  return breed;
	  }


	  @Override
          public String toString() {
		  return "PoliceDog{" + 
			  "name='" + name + '\'' + 
			  ", breed='" + breed + '\'' + 
			  '}';
	  }
  }








