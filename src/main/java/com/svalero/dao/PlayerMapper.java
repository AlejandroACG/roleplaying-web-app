package com.svalero.dao;
import com.svalero.domain.Character;
import com.svalero.domain.Player;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static com.svalero.dao.Database.jdbi;

public class PlayerMapper implements RowMapper<Player> {
    @Override
    public Player map(ResultSet rs, StatementContext ctx) throws SQLException {
        int id = rs.getInt("PLAYER_ID");

        CharacterDAO characterDAO = jdbi.onDemand(CharacterDAO.class);

        List<Character> characters = characterDAO.getCharactersByPlayerId(id);

        return new Player(id,
                rs.getString("FIRST_NAME"),
                rs.getString("LAST_NAME"),
                rs.getString("NICKNAME"),
                rs.getString("EMAIL"),
                rs.getDate("REGIST_DATE").toLocalDate(),
                characters);
    }
}
