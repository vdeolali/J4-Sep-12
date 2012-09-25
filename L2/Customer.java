package myPackage;

public class Customer
{
    private String firstName;
    private String lastName;

    public Customer(String firstName, String lastName)
    {
        setFirstName(firstName);
        setLastName(lastName);
    }

    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getFirstName() { return firstName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getLastName() { return lastName; }
}