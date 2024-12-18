  package policestation;

  import java.util.ArrayList;
  import java.util.List;


  // Class representing a kennel for police dogs
  class DogKennel {
// This method is named dogs;
	  public List<PoliceDog> dogs;

          // Constructor to initialize the DogKennel object
	  public DogKennel() {
		  this.dogs = new ArrayList<>();
	  }

          // Method to add a dog to the kennel
	  public void addDog(PoliceDog dog) {
		  dogs.add(dog);
	  }

          // Method to remove a dog from the kennel
	  public void removeDog(PoliceDog dog) {
		  dogs.remove(dog);
	  }

          // Method to get the list of dogs in the kennel
	  public List<PoliceDog> getDogs() {
		  return dogs;
	  }

          // Overriding the toString method to return a formatted string
	  @Override
// This method is named toString
	  public String toString() {
		  return "DogKennel{" +
			  "dogs=" + dogs +
			  '}';
	  }
  }


  // Class representing a handler for police dogs, extending DogKennel
  public class PoliceDogHandler extends DogKennel {
          // Method to train a specific police dog
	  public void trainDog(PoliceDog dog) {
		  System.out.println(dog.getName() + " is being trained.");
	  }

          // Main method to demonstrate the functionality
	  public static void main(String[] args) {
		  PoliceDogHandler policeDogs = new PoliceDogHandler();

                  // Creating instances of PoliceDog
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


                  // Adding dogs to the kennel
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

                  // Training a specific dog
		  policeDogs.trainDog(dog1);

                // Printing the details of all dogs in the kennel
                for (PoliceDog dog : policeDogs.getDogs()) {
                     System.out.println(dog);
		}
	  }
  }


  // Class representing a police dog
  class PoliceDog {
// This method is named name;
	  private String name;
// This method is named breed;
	  private String breed;

          // Constructor to initialize the PoliceDog object
	  public PoliceDog(String name, String breed) {
		  this.name = name;
		  this.breed = breed;
	  }

// This method is named fields
          // Getter methods to access private fields
	  public String getName() {
		  return name;
	  }

// This method is named getBreed
	  public String getBreed() {
		  return breed;
	  }


          // Overriding the toString method to return a formatted string
	  @Override
// This method is named toString
          public String toString() {
		  return "PoliceDog{" +
			  "name='" + name + '\'' +
			  ", breed='" + breed + '\'' +
			  '}';
	  }
  }








