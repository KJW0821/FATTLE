package com.sixman.fattle.api.controller;

import com.sixman.fattle.api.service.ExpService;
import com.sixman.fattle.dto.response.ExpHistoryResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/exp")
@RequiredArgsConstructor
@Tag(name = "Exp 컨트롤러", description = "경험치 관리를 위한 API")
public class ExpController {

    private final ExpService expService;

    @Operation(summary = "경험치 히스토리 조회",
            description = "유저 코드를 통해 경험치 히스토리 조회")
    @ApiResponse(responseCode = "200", description = "경험치 히스토리 조회 성공")
    @GetMapping("/history/{userCode}")
    public ResponseEntity<ExpHistoryResponse> getExpHistory(@PathVariable long userCode) {
        ExpHistoryResponse response = expService.getExpHistory(userCode);
        return ResponseEntity.ok(response);
    }

}
