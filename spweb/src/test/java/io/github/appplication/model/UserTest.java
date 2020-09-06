package io.github.appplication.model;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class UserTest {
  @Test
  public void toStringTest() {
    User user = new User(1, "foo", "foo@abc.com");
    assertEquals("1,foo,foo@abc.com", user.toString());
  }
}
