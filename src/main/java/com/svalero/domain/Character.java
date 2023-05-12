package com.svalero.domain;
import lombok.*;

import java.util.List;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
public class Character {
    String id;
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
