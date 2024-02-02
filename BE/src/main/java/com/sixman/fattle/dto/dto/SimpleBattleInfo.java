package com.sixman.fattle.dto.dto;

import com.querydsl.core.annotations.QueryProjection;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.sql.Timestamp;

@Data
@Builder
public class SimpleBattleInfo {

    @QueryProjection
    public SimpleBattleInfo(String name, int status, Timestamp startDate, Timestamp endDate) {
        this.name = name;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    private String name;

    private int status;

    private Timestamp startDate;

    private Timestamp endDate;

}
