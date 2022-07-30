import com.github.javafaker.Faker;

public class DataGenarator {

	
public static String GetEmail(){
		
		Faker faker=new Faker();
		return faker.name().firstName()+faker.name().lastName()+"@gmail.com";
      }

	public static String  GetFirstName() {
	Faker faker=new Faker();
	return faker.name().firstName();
	}
	
	public static String GetLastName() {
		
		Faker faker=new Faker();
		return faker.name().lastName();
	}
	public static String DOB() {
		
		Faker faker=new Faker();
		return faker.date().toString();
	}
	public static String GetPhoneNumber() {
		
		Faker faker=new Faker();
		return faker.phoneNumber().cellPhone();
	}
}
