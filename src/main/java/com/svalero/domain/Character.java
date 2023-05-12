package com.svalero.domain;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import java.util.List;

@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
public class Character {
    int id;
    @NonNull
    String firstName;
    @NonNull
    String race;
    @NonNull
    String alignment;
    @NonNull
    String characterClass;
    @NonNull
    String lore;
    @NonNull
    Player player;
}
