package org.gandharva.gandharva.configuration;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class AppConfig {
    private static final String CONFIG_FILE = "config.properties";

    private Properties properties;

    public AppConfig() {
        loadConfig();
    }

    private void loadConfig() {
        properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream(CONFIG_FILE)) {
            if (input == null) {
                System.out.println("Sorry, unable to find " + CONFIG_FILE);
                return;
            }

            properties.load(input);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public String getDatabaseName() {
        return properties.getProperty("database.name");
    }

    public String getDatabaseUsername() {
        return properties.getProperty("database.username");
    }

    public String getDatabasePassword() {
        return properties.getProperty("database.password");
    }

    public String getDatabaseHost() {
        return properties.getProperty("database.host");
    }

    public String getDatabasePort() {
        return properties.getProperty("database.port");
    }
}
