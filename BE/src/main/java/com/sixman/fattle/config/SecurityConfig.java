package com.sixman.fattle.config;

import com.sixman.fattle.filter.JwtAuthenticationFilter;
import com.sixman.fattle.jwt.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;
import org.springframework.security.config.annotation.web.configurers.HttpBasicConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

	private final JwtTokenProvider jwtTokenProvider;

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
		return httpSecurity
				// REST API이므로 basic auth 및 csrf 보안을 사용하지 않음
				.httpBasic(HttpBasicConfigurer::disable)
				.csrf(CsrfConfigurer::disable)
				// JWT를 사용하기 때문에 session을 사용하지 않음
				.sessionManagement(configurer ->
						configurer.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
				.authorizeHttpRequests(authorize -> authorize
								// 해당 API에 대해서는 모든 요청을 허가
								.requestMatchers("/swagger-ui/**", "/oauth/login/**")
								.permitAll()
								// 이 밖에 모든 요청에 대해서 인증을 필요로 함
								.anyRequest().authenticated())
				// JWT 인증을 위하여 필터 실행
				.addFilter(new JwtAuthenticationFilter(jwtTokenProvider))
				.build();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		//BCrypt Encoder 사용
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

}