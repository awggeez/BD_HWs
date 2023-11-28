package db.hws.hw7.spirng.database.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "events")
public class Event {
    @Id
    @Column(name = "event_id")
    private String eventId;

    private String name;
    private String eventtype;

    @Column(name = "olympic_id")
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "olympic_id", referencedColumnName = "olympic_id")
    private Olympics olympicId;

    @Column(name = "is_team_event")
    private Integer isTeamEvent;

    @Column(name = "num_players_in_team")
    private Integer numPlayersInTeam;

    @Column(name = "result_noted_in")
    private String resultNotedIn;
}