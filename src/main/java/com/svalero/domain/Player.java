package com.svalero.domain;
import lombok.*;
import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Player {
    String id;
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
}
