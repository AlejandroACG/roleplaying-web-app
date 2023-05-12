package com.svalero.dao;
import com.svalero.domain.Character;
import com.svalero.domain.Player;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import static com.svalero.dao.Database.jdbi;

public class CharacterMapper implements RowMapper<Character> {
    @Override
    public Character map(ResultSet rs, StatementContext ctx) throws SQLException {
        PlayerDAO playerDAO = jdbi.onDemand(PlayerDAO.class);
        Player player = playerDAO.getPlayer("PLAYER_ID");
        return new Character("CHARACT_ID",
                rs.getString("FIRST_NAME"),
                rs.getString("RACE"),
                rs.getString("ALIGNMENT"),
                rs.getString("CHARACTER_CLASS"),
                rs.getString("LORE"),
                player);
    }
}
