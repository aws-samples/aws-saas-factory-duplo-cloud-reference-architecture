package com.saas.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.saas.service.UserService;
import com.saas.service.impl.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public UserDetailsService userDetailsService() {
		return new UserDetailsServiceImpl();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(userDetailsService());
		authProvider.setPasswordEncoder(passwordEncoder());
		
		return authProvider;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests(requests -> requests
                .antMatchers("/", "/login", "/oauth/**").permitAll()
                .anyRequest().authenticated())
                .formLogin(login -> login.permitAll()
                        .loginPage("/login")
                        .usernameParameter("email")
                        .passwordParameter("pass")
                        .defaultSuccessUrl("/list"))
                .oauth2Login(login -> login
                        .loginPage("/login")
                        .userInfoEndpoint()
                        .userService(oauthUserService)
                        .and()
                        .successHandler(new AuthenticationSuccessHandler() {

                            @Override
                            public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                                                                                           Authentication authentication) throws IOException, ServletException {
                                System.out.println("AuthenticationSuccessHandler invoked");
                                System.out.println("Authentication name: " + authentication.getName());
                                //CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();
                        
                                //userService.processOAuthPostLogin(oauthUser.getEmail());
                        
                                response.sendRedirect("/list");
                            }
                        }))
                .logout(logout -> logout.logoutSuccessUrl("/").permitAll())
                .exceptionHandling(handling -> handling.accessDeniedPage("/403"))
			;
	}
	
	@Autowired
	private CustomOAuth2UserService oauthUserService;
	
	@Autowired
	private UserService userService;
}
