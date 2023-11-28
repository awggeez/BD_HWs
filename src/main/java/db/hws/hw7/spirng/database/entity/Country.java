package db.hws.hw7.spirng.database.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "countries")
public class Country {
    @Id
    private String name;

    @Column(name = "country_id")
    private String countryId;

    @Column(name = "area_sqkm")
    private Integer areaSqkm;

    private Integer population;
}
