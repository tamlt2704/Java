public class User {
  long id;
  String name;
  String email;

  public User(long id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }

  public void setId(long id) {
    this.id = id;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public long getId() {
    return this.id;
  }

  public String getName() {
    return this.name;
  }

  public String getEmail() {
    return this.email;
  }

  @Override
  public String toString() {
    return String.format("%d,%s,%s", this.id, this.name, this.email);
  }
}
