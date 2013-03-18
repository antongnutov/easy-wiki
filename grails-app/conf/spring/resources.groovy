import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler

beans = {
    securityContextLogoutHandler(SecurityContextLogoutHandler) {
        invalidateHttpSession = false
    }
}