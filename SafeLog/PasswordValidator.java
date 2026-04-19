import java.util.Scanner;

public class PasswordValidator {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.print("Enter your password: ");
            String password = scanner.nextLine();

            boolean isValid = validatePassword(password);

            if (isValid) {
                System.out.println("Password is strong and accepted.");
                break;
            }

            System.out.println("Try again.\n");
        }

        scanner.close();
    }

    // main validation method
    static boolean validatePassword(String password) {

        boolean lengthOk = checkLength(password);
        boolean hasUpper = checkUpperCase(password);
        boolean hasDigit = checkDigit(password);

        if (!lengthOk) {
            System.out.println("Too short (minimum 8 characters required)");
        }

        if (!hasUpper) {
            System.out.println("Missing an uppercase letter");
        }

        if (!hasDigit) {
            System.out.println("Missing a digit");
        }

        return lengthOk && hasUpper && hasDigit;
    }

    // check length
    static boolean checkLength(String password) {
        return password.length() >= 8;
    }

    // check uppercase
    static boolean checkUpperCase(String password) {
        for (int i = 0; i < password.length(); i++) {
            if (Character.isUpperCase(password.charAt(i))) {
                return true;
            }
        }
        return false;
    }

    // check digit
    static boolean checkDigit(String password) {
        for (int i = 0; i < password.length(); i++) {
            if (Character.isDigit(password.charAt(i))) {
                return true;
            }
        }
        return false;
    }
}