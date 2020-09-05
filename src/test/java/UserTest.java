package io.github.app.model;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import io.github.app.model.User;

public class UserTest {
  @Test
  public void toStringTest() {
    User user = new User(1, "foo", "foo@abc.com");
    assertEquals("1,foo,foo@abc.com", user.toString());
  }
}
