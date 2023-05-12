import com.svalero.dao.CharacterDAO;
import com.svalero.dao.Database;
import com.svalero.dao.PlayerDAO;
import com.svalero.domain.Character;
import com.svalero.domain.Player;

import java.util.List;


public class Prueba {
    public static void main(String[] args) throws ClassNotFoundException {
        Database.connect();
         Character character = Database.jdbi.withExtension(CharacterDAO.class, dao -> dao.getCharacter("1"));

         System.out.print(character);

      }
}
