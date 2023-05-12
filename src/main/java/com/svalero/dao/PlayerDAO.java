package com.svalero.dao;
import com.svalero.domain.Player;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import java.time.LocalDate;
import java.util.List;

public interface PlayerDAO {
    @SqlQuery("SELECT * FROM PLAYERS")
    @UseRowMapper(PlayerMapper.class)
    List<Player> getPlayers();

    @SqlQuery("SELECT * FROM PLAYERS WHERE PLAYER_ID = ?")
    @UseRowMapper(PlayerMapper.class)
    Player getPlayer(String id);

    @SqlQuery("SELECT * FROM PLAYERS WHERE FIRST_NAME || ' ' || LAST_NAME LIKE '%' || ? || '%'")
    @UseRowMapper(PlayerMapper.class)
    List<Player> getPlayersByFullName(String fullName);

    @SqlUpdate("INSERT INTO PLAYERS (FIRST_NAME, LAST_NAME, NICKNAME, EMAIL, REGIST_DATE) VALUES (?, ?, ?, ?, ?)")
    void addPlayer(String firstName, String lastName, String nickname, String email, LocalDate registrationDate);

    @SqlUpdate("UPDATE PLAYERS SET FIRST_NAME = ?, LAST_NAME = ?, NICKNAME = ?, EMAIL = ?, REGIST_DATE = ? WHERE PLAYER_ID = ?")
    void modifyPlayer(String firstName, String lastName, String nickname, String email, LocalDate registrationDate, String id);

    @SqlQuery("SELECT EXISTS(SELECT 1 FROM PLAYERS WHERE PLAYER_ID = ?)")
    boolean isPlayer(String id);

    @SqlUpdate("DELETE FROM PLAYERS WHERE PLAYER_ID = ?")
    void deletePlayer(String id);
}
