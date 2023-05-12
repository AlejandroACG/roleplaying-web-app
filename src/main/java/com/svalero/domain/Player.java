package com.svalero.domain;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Player {
    int id;
    @NonNull
    String firstName;
    @NonNull
    String lastName;
    @NonNull
    String nickname;
    @NonNull
    String email;
    @NonNull
    LocalDate registrationDate;
    @NonNull
    List<Character> characters;
}
