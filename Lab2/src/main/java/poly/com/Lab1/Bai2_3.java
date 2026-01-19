package poly.com.Lab1;

import DAO.UserManager;
import entity.User;

import java.util.List;


public class Bai2_3 {
    public static void main(String[] args) {
        UserManager userManager = new UserManager();

        User user = new User();
        user.setId(1);
        user.setFullname("Bui Hau");
        user.setPassword("123");
        user.setEmail("tribdtv00042@fpt.edu.vn");
        user.setAdmin(true);

       //userManager.create(user);

        //userManager.update(user);

        //userManager.findAll().forEach(System.out::println);

        //userManager.deleteById("U100");

        //System.out.println(userManager.findById("U100"));


      //  Bai 3
        List<User> users = userManager.findByEmail();
        for (User u : users) {
            System.out.println("Name: " + u.getFullname() + " | Email: " + u.getEmail());
        }


        //Bai 4
//        int number = 2;
//        int size = 5;
//        List<User> users = userManager.findByPage(number, size);
//        for (User u : users) {q
//            System.out.println("Id: " + u.getId()
//            + " | Fullname: " + u.getFullname()
//            + " | Email: " + u.getEmail());
//        }


    }
}
