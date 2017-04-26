
package Controlador;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*Validar Correo*/

/**
 *
 * @author Abraham
 */
public class ValidarCorreo {

    String PATTERN_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "ciencias.unam.mx";
 
    /**
     * Validate given email with regular expression.
     * 
     * @param email
     *            email for validation
     * @return true valid email, otherwise false
     */
    public boolean validar(String email) {
 
        // Compiles the given regular expression into a pattern.
        Pattern pattern = Pattern.compile(PATTERN_EMAIL);
 
        // Match the given input against this pattern
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
 
    }
}
