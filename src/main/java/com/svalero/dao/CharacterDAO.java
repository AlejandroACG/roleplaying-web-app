package com.svalero.dao;
import com.svalero.domain.Character;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import java.util.List;

public interface CharacterDAO {
    @SqlQuery("SELECT * FROM CHARACTERS")
    @UseRowMapper(CharacterMapper.class)
    List<Character> getCharacters();

    @SqlQuery("SELECT * FROM CHARACTERS WHERE PLAYER_ID = ?")
    @UseRowMapper(CharacterMapper.class)
    List<Character> getCharactersByPlayerId(String id);

    @SqlQuery("SELECT * FROM CHARACTERS WHERE UPPER(FIRST_NAME) LIKE UPPER('%' || ? || '%')")
    @UseRowMapper(CharacterMapper.class)
    List<Character> getCharactersByName(String name);

    @SqlQuery("SELECT * FROM CHARACTERS WHERE CHARACTER_ID = ?")
    @UseRowMapper(CharacterMapper.class)
    Character getCharacter(String id);

    // TODO Revisar luego.
    @SqlQuery("SELECT * FROM CHARACTERS WHERE PLAYER_ID = ? FETCH FIRST 1 ROW ONLY")
    @UseRowMapper(CharacterMapper.class)
    Character getFirstCharacterOfPlayer(String id);

    @SqlUpdate("INSERT INTO CHARACTERS (PLAYER_ID, FIRST_NAME, RACE, ALIGNMENT, CHARACTER_CLASS, LORE) VALUES (?, ?, ?, ?, ?, ?)")
    void addCharacter(String id, String firstName, String race, String alignment, String characterClass, String lore);

    @SqlUpdate("UPDATE CHARACTERS SET FIRST_NAME = ?, RACE = ?, ALIGNMENT = ?, CHARACTER_CLASS = ?, LORE = ? WHERE CHARACTER_ID = ?")
    void modifyCharacter(String firstName, String race, String alignment, String characterClass, String lore, String id);

    @SqlQuery("SELECT EXISTS(SELECT 1 FROM CHARACTERS WHERE CHARACTER_ID = ?)")
    boolean isCharacter(String id);

    @SqlUpdate("DELETE FROM CHARACTERS WHERE CHARACTER_ID = ?")
    void deleteCharacter(String id);
}
