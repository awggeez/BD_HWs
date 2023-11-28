package db.hws.hw7.spirng.database.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "olympics")
public class Olympics {

    @Id
    @Column(name = "olympic_id")
    private String olympicId;

    @Column(name = "country_id")
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "country_id", referencedColumnName = "country_id")
    private Country countryId;

    private String city;

    private Integer year;

    private LocalDateTime startdate;
    private LocalDateTime enddate;
}