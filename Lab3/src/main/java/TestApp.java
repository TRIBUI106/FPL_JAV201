import dao.VideoDAO;
import dao.impl.UserDAOImpl;
import dao.impl.VideoDAOImpl;
import entity.User;

public class TestApp {
    public static void main(String[] args) {
        VideoDAO vdao = new VideoDAOImpl();
        System.out.println(vdao.findAll().size());
    }

}
